import 'package:pokeapp_flutter/data/models/firered_leafgreen_model.dart';
import 'package:pokeapp_flutter/data/models/official_artwork_model.dart';
import 'package:pokeapp_flutter/domain/entities/generation_iii.dart';

class GenerationIiiModel extends GenerationIii {
  GenerationIiiModel({
    super.emerald,
    super.fireredLeafgreen,
    super.rubySapphire,
  });

  factory GenerationIiiModel.fromMap(Map<String, dynamic> json) {
    return GenerationIiiModel(
      emerald: json["emerald"] == null ? null : OfficialArtworkModel.fromMap(json["emerald"]),
      fireredLeafgreen: json["firered-leafgreen"] == null ? null : FireredLeafgreenModel.fromMap(json["firered-leafgreen"]),
      rubySapphire: json["ruby-sapphire"] == null ? null : FireredLeafgreenModel.fromMap(json["ruby-sapphire"]),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      // "emerald": emerald?.toMap(),
      // "firered-leafgreen": fireredLeafgreen?.toMap(),
      // "ruby-sapphire": rubySapphire?.toMap(),
    };
  }
}
