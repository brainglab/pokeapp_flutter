import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokeapp_flutter/presentation/providers/pokemon_image_provider.dart';

class BLNetworkImage extends ConsumerWidget {
  const BLNetworkImage({super.key, @required this.mUrl, @required this.boxFit, this.imageAsset = 'assets/images/no-image.png'});

  final String? mUrl;
  final BoxFit? boxFit;
  final String imageAsset;

  Widget _buildImage(Uint8List image) {
    return FadeInImage(
      placeholder: Image.asset(
        imageAsset,
        fit: boxFit,
      ).image,
      image: Image.memory(image, fit: boxFit).image,
      fit: boxFit,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mImageAsyncValue = ref.watch(mCachedPokemonImageProvider(mUrl!));

    return mImageAsyncValue.when(
      data: (mImage) {
        if (mImage != null) {
          return _buildImage(mImage);
        } else {
          return Image.asset(
            'assets/images/no-image.png',
            fit: boxFit,
          );
        }
      },
      loading: () => Image.asset(
        'assets/images/no-image.png',
        fit: boxFit,
      ),
      error: (_, __) => Image.asset(
        'assets/images/no-image.png',
        fit: boxFit,
      ),
    );
  }
}
