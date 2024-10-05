class VersionGroup {
  String? name;
  String? url;

  VersionGroup({
    this.name,
    this.url,
  });

  factory VersionGroup.fromMap(Map<String, dynamic> json) => VersionGroup(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
      };
}
