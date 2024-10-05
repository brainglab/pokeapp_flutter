class GenerationViiiIcons {
  String? frontDefault;
  String? frontFemale;

  GenerationViiiIcons({
    this.frontDefault,
    this.frontFemale,
  });

  factory GenerationViiiIcons.fromMap(Map<String, dynamic> json) => GenerationViiiIcons(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
      );

  Map<String, dynamic> toMap() => {
        "front_default": frontDefault,
        "front_female": frontFemale,
      };
}
