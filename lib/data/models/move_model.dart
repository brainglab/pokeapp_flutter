import 'package:pokeapp_flutter/data/models/specie_model.dart';
import 'package:pokeapp_flutter/data/models/version_group_detail_model.dart';
import 'package:pokeapp_flutter/domain/entities/move.dart';
import 'package:pokeapp_flutter/domain/entities/version_group_detail.dart';

class MoveModel extends Move {
  MoveModel({
    super.move,
    super.versionGroupDetails,
  });

  factory MoveModel.fromMap(Map<String, dynamic> json) {
    return MoveModel(
      move: json["move"] == null ? null : SpeciesModel.fromMap(json["move"]),
      versionGroupDetails: json["version_group_details"] == null ? [] : List<VersionGroupDetail>.from(json["version_group_details"]!.map((x) => VersionGroupDetailModel.fromMap(x))),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      // "move": move?.toMap(),
      // "version_group_details": versionGroupDetails == null ? [] : List<dynamic>.from(versionGroupDetails!.map((x) => x.toMap())),
    };
  }
}
