class DreamWorld {
  String? frontDefault;
  dynamic frontFemale;

  DreamWorld({
    this.frontDefault,
    this.frontFemale,
  });

  factory DreamWorld.fromMap(Map<String, dynamic> json) => DreamWorld(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
      );

  Map<String, dynamic> toMap() => {
        "front_default": frontDefault,
        "front_female": frontFemale,
      };
}
