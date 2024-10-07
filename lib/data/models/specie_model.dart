import 'package:pokeapp_flutter/domain/entities/species.dart';

class SpeciesModel extends Species {
  SpeciesModel({
    super.name,
    super.url,
  });

  factory SpeciesModel.fromMap(Map<String, dynamic> json) {
    return SpeciesModel(
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
