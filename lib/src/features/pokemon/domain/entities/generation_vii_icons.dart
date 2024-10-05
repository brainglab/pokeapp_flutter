class GenerationViiIcons {
  String? frontDefault;
  dynamic frontFemale;

  GenerationViiIcons({
    this.frontDefault,
    this.frontFemale,
  });

  factory GenerationViiIcons.fromMap(Map<String, dynamic> json) => GenerationViiIcons(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
      );

  Map<String, dynamic> toMap() => {
        "front_default": frontDefault,
        "front_female": frontFemale,
      };
}
