class ImageModel {
  ImageModel({
    this.uri,
    this.width,
    this.height,
  });

  String uri;
  int width;
  int height;

  factory ImageModel.fromMap(Map<String, dynamic> json) => ImageModel(
        uri: json["uri"] == null ? null : json["uri"],
        width: json["width"] == null ? null : json["width"],
        height: json["height"] == null ? null : json["height"],
      );

  Map<String, dynamic> toMap() => {
        "uri": uri == null ? null : uri,
        "width": width == null ? null : width,
        "height": height == null ? null : height,
      };
}
