import 'package:pokeapp_flutter/domain/entities/move_learn_method.dart';
import 'package:pokeapp_flutter/domain/entities/version_group.dart';

class VersionGroupDetail {
  int? levelLearnedAt;
  MoveLearnMethod? moveLearnMethod;
  VersionGroup? versionGroup;

  VersionGroupDetail({
    this.levelLearnedAt,
    this.moveLearnMethod,
    this.versionGroup,
  });
}
