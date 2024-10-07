import 'package:pokeapp_flutter/domain/entities/version_group.dart';

class VersionGroupModel extends VersionGroup {
  VersionGroupModel({
    super.name,
    super.url,
  });

  factory VersionGroupModel.fromMap(Map<String, dynamic> json) {
    return VersionGroupModel(
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
