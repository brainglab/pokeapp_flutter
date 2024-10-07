import 'package:pokeapp_flutter/domain/entities/move_learn_method.dart';

class MoveLearnMethodModel extends MoveLearnMethod {
  MoveLearnMethodModel({
    super.name,
    super.url,
  });

  factory MoveLearnMethodModel.fromMap(Map<String, dynamic> json) {
    return MoveLearnMethodModel(
      name: json["name"],
      url: json["url"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "url": url,
    };
  }
}
