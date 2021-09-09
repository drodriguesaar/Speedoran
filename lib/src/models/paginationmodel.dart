import 'package:speedoran/src/models/linkmodel.dart';

class PaginationModel {
  PaginationModel({
    this.offset,
    this.max,
    this.size,
    this.links,
  });

  int offset;
  int max;
  int size;
  List<LinkModel> links;

  factory PaginationModel.fromMap(Map<String, dynamic> json) => PaginationModel(
        offset: json["offset"] == null ? null : json["offset"],
        max: json["max"] == null ? null : json["max"],
        size: json["size"] == null ? null : json["size"],
        links: json["links"] == null
            ? null
            : List<LinkModel>.from(
                json["links"].map((x) => LinkModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "offset": offset == null ? null : offset,
        "max": max == null ? null : max,
        "size": size == null ? null : size,
        "links": links == null
            ? null
            : List<LinkModel>.from(links.map((x) => x.toMap())),
      };
}
