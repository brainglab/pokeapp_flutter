import 'package:pokeapp_flutter/src/features/pokemon/domain/entities/specie.dart';
import 'package:pokeapp_flutter/src/features/pokemon/domain/entities/version_detail.dart';

class HeldItem {
  Species? item;
  List<VersionDetail>? versionDetails;

  HeldItem({
    this.item,
    this.versionDetails,
  });

  factory HeldItem.fromMap(Map<String, dynamic> json) => HeldItem(
        item: json["item"] == null ? null : Species.fromMap(json["item"]),
        versionDetails: json["version_details"] == null ? [] : List<VersionDetail>.from(json["version_details"]!.map((x) => VersionDetail.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "item": item?.toMap(),
        "version_details": versionDetails == null ? [] : List<dynamic>.from(versionDetails!.map((x) => x.toMap())),
      };
}
