import 'package:pokeapp_flutter/domain/entities/ability.dart';

class AbilityModel extends Ability {
  AbilityModel({
    super.name,
    super.url,
  });

  factory AbilityModel.fromMap(Map<String, dynamic> json) {
    return AbilityModel(
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
