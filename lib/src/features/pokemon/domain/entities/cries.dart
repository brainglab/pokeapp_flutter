class Cries {
  String? latest;
  String? legacy;

  Cries({
    this.latest,
    this.legacy,
  });

  factory Cries.fromMap(Map<String, dynamic> json) => Cries(
        latest: json["latest"],
        legacy: json["legacy"],
      );

  Map<String, dynamic> toMap() => {
        "latest": latest,
        "legacy": legacy,
      };
}
