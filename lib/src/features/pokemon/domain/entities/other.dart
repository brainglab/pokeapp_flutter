import 'package:pokeapp_flutter/src/features/pokemon/domain/entities/dream_world.dart';
import 'package:pokeapp_flutter/src/features/pokemon/domain/entities/home.dart';
import 'package:pokeapp_flutter/src/features/pokemon/domain/entities/official_artwork.dart';
import 'package:pokeapp_flutter/src/features/pokemon/domain/entities/showdown.dart';

class Other {
  DreamWorld? dreamWorld;
  Home? home;
  OfficialArtwork? officialArtwork;
  Showdown? showdown;

  Other({
    this.dreamWorld,
    this.home,
    this.officialArtwork,
    this.showdown,
  });

  factory Other.fromMap(Map<String, dynamic> json) => Other(
        dreamWorld: json["dream_world"] == null ? null : DreamWorld.fromMap(json["dream_world"]),
        home: json["home"] == null ? null : Home.fromMap(json["home"]),
        officialArtwork: json["official-artwork"] == null ? null : OfficialArtwork.fromMap(json["official-artwork"]),
        showdown: json["showdown"] == null ? null : Showdown.fromMap(json["showdown"]),
      );

  Map<String, dynamic> toMap() => {
        "dream_world": dreamWorld?.toMap(),
        "home": home?.toMap(),
        "official-artwork": officialArtwork?.toMap(),
        "showdown": showdown?.toMap(),
      };
}
