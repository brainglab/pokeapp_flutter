import 'package:pokeapp_flutter/domain/entities/species.dart';
import 'package:pokeapp_flutter/domain/entities/version_detail.dart';

class HeldItems {
  Species? item;
  List<VersionDetail>? versionDetails;

  HeldItems({
    this.item,
    this.versionDetails,
  });
}
