class Species {
  String? name;
  String? url;

  Species({
    this.name,
    this.url,
  });

  factory Species.fromMap(Map<String, dynamic> json) => Species(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
      };
}
