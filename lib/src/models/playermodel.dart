class PlayerModel {
  PlayerModel({
    this.rel,
    this.id,
    this.uri
  });

  String rel;
  String id;
  String uri;

  factory PlayerModel.fromMap(Map<String, dynamic> json) => PlayerModel(
        rel: json["rel"] == null ? null : json["rel"],
        id: json["id"] == null ? null : json["id"],
        uri: json["uri"] == null ? null : json["uri"],
      );

  Map<String, dynamic> toMap() => {
        "rel": rel == null ? null : rel,
        "id": id == null ? null : id,
        "uri": uri == null ? null : uri,
      };
}
