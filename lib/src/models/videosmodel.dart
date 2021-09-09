import 'package:speedoran/src/models/videolinkmodel.dart';

class VideosModel {
  VideosModel({
    this.links,
  });

  List<VideoLinkModel> links;

  factory VideosModel.fromMap(Map<String, dynamic> json) => VideosModel(
        links: json["links"] == null
            ? null
            : List<VideoLinkModel>.from(
                json["links"].map((x) => VideoLinkModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "links": links == null
            ? null
            : List<dynamic>.from(links.map((x) => x.toMap())),
      };
}
