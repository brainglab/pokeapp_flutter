import 'package:pokeapp_flutter/src/features/pokemon/domain/entities/move_learn_method.dart';
import 'package:pokeapp_flutter/src/features/pokemon/domain/entities/version_group.dart';

class VersionGroupDetail {
  int? levelLearnedAt;
  MoveLearnMethod? moveLearnMethod;
  VersionGroup? versionGroup;

  VersionGroupDetail({
    this.levelLearnedAt,
    this.moveLearnMethod,
    this.versionGroup,
  });

  factory VersionGroupDetail.fromMap(Map<String, dynamic> json) => VersionGroupDetail(
        levelLearnedAt: json["level_learned_at"],
        moveLearnMethod: json["move_learn_method"] == null ? null : MoveLearnMethod.fromMap(json["move_learn_method"]),
        versionGroup: json["version_group"] == null ? null : VersionGroup.fromMap(json["version_group"]),
      );

  Map<String, dynamic> toMap() => {
        "level_learned_at": levelLearnedAt,
        "move_learn_method": moveLearnMethod?.toMap(),
        "version_group": versionGroup?.toMap(),
      };
}
