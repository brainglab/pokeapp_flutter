import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokeapp_flutter/data/helpers/bl_dio.dart';
import 'package:pokeapp_flutter/data/helpers/bl_endpoint.dart';
import 'package:pokeapp_flutter/data/models/pokemon_model.dart';
import 'package:tuple/tuple.dart';

abstract class PokemonDataSource {
  Future<Tuple2<List<PokemonModel>, String?>> getPokemons(String mParameters);
  Future<PokemonModel> getPokemonForId(String id);
  Future<Tuple2<bool, Uint8List?>> getPokemonImage(String mUrl);
}

class PokemonDataSourceImpl implements PokemonDataSource {
  final Dio mDio = getDio();
  final Dio mDioImage = getDioImage();

  @override
  Future<Tuple2<List<PokemonModel>, String>> getPokemons(String mParameters) async {
    var mAuxParameters = mParameters.isNotEmpty ? mParameters : '';
    final mUrl = Uri(
      scheme: BlEndpoint.mWebServiceScheme,
      host: BlEndpoint.mWebServiceURL,
      port: BlEndpoint.mWebServicePort,
      path: '/api/v2/pokemon',
      query: mAuxParameters,
    );
    final response = await mDio.get(mUrl.toString());
    String mNextUrl = response.data['next'] ?? '';
    String mNextParams = mNextUrl.contains('?') ? mNextUrl.split('?')[1] : '';
    return Tuple2<List<PokemonModel>, String>(PokemonModel.fromJsonList(response.data['results']), mNextParams);
  }

  @override
  Future<PokemonModel> getPokemonForId(String id) async {
    final mUrl = Uri(scheme: BlEndpoint.mWebServiceScheme, host: BlEndpoint.mWebServiceURL, port: BlEndpoint.mWebServicePort, path: '/api/v2/pokemon/$id');
    final response = await mDio.get(mUrl.toString());
    debugPrint('==> $runtimeType response: $response');
    return PokemonModel.fromMap(response.data);
  }

  @override
  Future<Tuple2<bool, Uint8List?>> getPokemonImage(String mAuxUrl) async {
    final mUrl = Uri.parse(mAuxUrl);
    debugPrint('==> $runtimeType mUrl: $mUrl');
    try {
      final response = await mDioImage.get(
        mUrl.toString(),
        options: Options(responseType: ResponseType.bytes),
      );
      if (response.statusCode == 200) {
        return Tuple2<bool, Uint8List?>(true, response.data as Uint8List);
      } else {
        return const Tuple2<bool, Uint8List?>(false, null);
      }
    } catch (e) {
      debugPrint('==> $runtimeType error: $e');
      return const Tuple2<bool, Uint8List?>(false, null);
    }
  }
}
