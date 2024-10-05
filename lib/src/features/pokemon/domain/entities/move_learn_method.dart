class MoveLearnMethod {
  String? name;
  String? url;

  MoveLearnMethod({
    this.name,
    this.url,
  });

  factory MoveLearnMethod.fromMap(Map<String, dynamic> json) => MoveLearnMethod(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "url": url,
      };
}
