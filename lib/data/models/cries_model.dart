import 'package:pokeapp_flutter/domain/entities/cries.dart';

class CriesModel extends Cries {
  CriesModel({
    super.latest,
    super.legacy,
  });

  factory CriesModel.fromMap(Map<String, dynamic> json) {
    return CriesModel(
      latest: json["latest"],
      legacy: json["legacy"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "latest": latest,
      "legacy": legacy,
    };
  }
}
