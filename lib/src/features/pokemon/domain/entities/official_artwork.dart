class OfficialArtwork {
  String? frontDefault;
  String? frontShiny;

  OfficialArtwork({
    this.frontDefault,
    this.frontShiny,
  });

  factory OfficialArtwork.fromMap(Map<String, dynamic> json) => OfficialArtwork(
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
      );

  Map<String, dynamic> toMap() => {
        "front_default": frontDefault,
        "front_shiny": frontShiny,
      };
}
