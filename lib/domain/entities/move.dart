import 'package:pokeapp_flutter/domain/entities/species.dart';
import 'package:pokeapp_flutter/domain/entities/version_group_detail.dart';

class Move {
  Species? move;
  List<VersionGroupDetail>? versionGroupDetails;

  Move({
    this.move,
    this.versionGroupDetails,
  });
}
