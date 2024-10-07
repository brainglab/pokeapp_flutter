import 'package:pokeapp_flutter/data/models/specie_model.dart';
import 'package:pokeapp_flutter/data/models/version_detail_model.dart';
import 'package:pokeapp_flutter/domain/entities/held_items.dart';
import 'package:pokeapp_flutter/domain/entities/version_detail.dart';

class HeldItemsModel extends HeldItems {
  HeldItemsModel({
    super.item,
    super.versionDetails,
  });

  factory HeldItemsModel.fromMap(Map<String, dynamic> json) {
    return HeldItemsModel(
      item: json["item"] == null ? null : SpeciesModel.fromMap(json["item"]),
      versionDetails: json["version_details"] == null ? [] : List<VersionDetail>.from(json["version_details"]!.map((x) => VersionDetailModel.fromMap(x))),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      // "item": item?.toMap(),
      // "version_details": versionDetails == null ? [] : List<dynamic>.from(versionDetails!.map((x) => x.toMap())),
    };
  }
}
