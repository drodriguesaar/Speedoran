class LinkModel {
  LinkModel({
    this.rel,
    this.uri,
  });

  String rel;
  String uri;

  factory LinkModel.fromMap(Map<String, dynamic> json) => LinkModel(
        rel: json["rel"] == null ? null : json["rel"],
        uri: json["uri"] == null ? null : json["uri"],
      );

  Map<String, dynamic> toMap() => {
        "rel": rel == null ? null : rel,
        "uri": uri == null ? null : uri,
      };
}
