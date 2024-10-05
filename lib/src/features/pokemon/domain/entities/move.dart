import 'package:pokeapp_flutter/src/features/pokemon/domain/entities/specie.dart';
import 'package:pokeapp_flutter/src/features/pokemon/domain/entities/version_group_detail.dart';

class Move {
  Species? move;
  List<VersionGroupDetail>? versionGroupDetails;

  Move({
    this.move,
    this.versionGroupDetails,
  });

  factory Move.fromMap(Map<String, dynamic> json) => Move(
        move: json["move"] == null ? null : Species.fromMap(json["move"]),
        versionGroupDetails: json["version_group_details"] == null ? [] : List<VersionGroupDetail>.from(json["version_group_details"]!.map((x) => VersionGroupDetail.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "move": move?.toMap(),
        "version_group_details": versionGroupDetails == null ? [] : List<dynamic>.from(versionGroupDetails!.map((x) => x.toMap())),
      };
}
