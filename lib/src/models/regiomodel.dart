import 'dart:convert';
import 'package:speedoran/src/models/linkmodel.dart';

RegionModel welcomeFromMap(String str) => RegionModel.fromMap(json.decode(str));

String regionToMap(RegionModel data) => json.encode(data.toMap());

class RegionModel {
  RegionModel({
    this.id,
    this.name,
    this.links,
  });

  String id;
  String name;
  List<LinkModel> links;

  factory RegionModel.fromMap(Map<String, dynamic> json) => RegionModel(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        links: json["links"] == null
            ? null
            : List<LinkModel>.from(
                json["links"].map((x) => LinkModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "links": links == null
            ? null
            : List<dynamic>.from(links.map((x) => x.toMap())),
      };
}
