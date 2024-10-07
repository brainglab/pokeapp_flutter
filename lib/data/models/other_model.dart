import 'package:pokeapp_flutter/data/models/dream_world_model.dart';
import 'package:pokeapp_flutter/data/models/home_model.dart';
import 'package:pokeapp_flutter/data/models/official_artwork_model.dart';
import 'package:pokeapp_flutter/data/models/showdown_model.dart';
import 'package:pokeapp_flutter/domain/entities/other.dart';

class OtherModel extends Other {
  OtherModel({
    super.dreamWorld,
    super.home,
    super.officialArtwork,
    super.showdown,
  });

  factory OtherModel.fromMap(Map<String, dynamic> json) {
    return OtherModel(
      dreamWorld: json["dream_world"] == null ? null : DreamWorldModel.fromMap(json["dream_world"]),
      home: json["home"] == null ? null : HomeModel.fromMap(json["home"]),
      officialArtwork: json["official-artwork"] == null ? null : OfficialArtworkModel.fromMap(json["official-artwork"]),
      showdown: json["showdown"] == null ? null : ShowdownModel.fromMap(json["showdown"]),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      // "dream_world": dreamWorld?.toMap(),
      // "home": home?.toMap(),
      // "official-artwork": officialArtwork?.toMap(),
      // "showdown": showdown?.toMap(),
    };
  }
}
