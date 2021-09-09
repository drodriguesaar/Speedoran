class SocialMediaModel {
  SocialMediaModel({
    this.uri,
  });

  String uri;

  factory SocialMediaModel.fromMap(Map<String, dynamic> json) =>
      SocialMediaModel(
        uri: json["uri"] == null ? null : json["uri"],
      );

  Map<String, dynamic> toMap() => {
        "uri": uri == null ? null : uri,
      };
}
