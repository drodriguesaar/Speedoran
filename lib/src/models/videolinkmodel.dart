class VideoLinkModel {
  VideoLinkModel({
    this.uri,
  });

  String uri;

  factory VideoLinkModel.fromMap(Map<String, dynamic> json) => VideoLinkModel(
        uri: json["uri"] == null ? null : json["uri"],
      );

  Map<String, dynamic> toMap() => {
        "uri": uri == null ? null : uri,
      };
}
