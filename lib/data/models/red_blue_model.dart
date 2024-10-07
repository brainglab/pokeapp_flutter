import 'package:pokeapp_flutter/domain/entities/red_blue.dart';

class RedBlueModel extends RedBlue {
  RedBlueModel({
    super.backDefault,
    super.backGray,
    super.backTransparent,
    super.frontDefault,
    super.frontGray,
    super.frontTransparent,
  });

  factory RedBlueModel.fromMap(Map<String, dynamic> json) {
    return RedBlueModel(
      backDefault: json["back_default"],
      backGray: json["back_gray"],
      backTransparent: json["back_transparent"],
      frontDefault: json["front_default"],
      frontGray: json["front_gray"],
      frontTransparent: json["front_transparent"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "back_default": backDefault,
      "back_gray": backGray,
      "back_transparent": backTransparent,
      "front_default": frontDefault,
      "front_gray": frontGray,
      "front_transparent": frontTransparent,
    };
  }
}
