import 'package:pokeapp_flutter/domain/entities/dream_world.dart';
import 'package:pokeapp_flutter/domain/entities/home.dart';
import 'package:pokeapp_flutter/domain/entities/official_artwork.dart';
import 'package:pokeapp_flutter/domain/entities/showdown.dart';

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
}
