import 'package:pokeapp_flutter/data/models/move_learn_method_model.dart';
import 'package:pokeapp_flutter/data/models/version_group_model.dart';
import 'package:pokeapp_flutter/domain/entities/version_group_detail.dart';

class VersionGroupDetailModel extends VersionGroupDetail {
  VersionGroupDetailModel({
    super.levelLearnedAt,
    super.moveLearnMethod,
    super.versionGroup,
  });

  factory VersionGroupDetailModel.fromMap(Map<String, dynamic> json) {
    return VersionGroupDetailModel(
      levelLearnedAt: json["level_learned_at"],
      moveLearnMethod: json["move_learn_method"] == null ? null : MoveLearnMethodModel.fromMap(json["move_learn_method"]),
      versionGroup: json["version_group"] == null ? null : VersionGroupModel.fromMap(json["version_group"]),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "level_learned_at": levelLearnedAt,
      // "move_learn_method": moveLearnMethod?.toMap(),
      //   "version_group": versionGroup?.toMap(),
    };
  }
}
