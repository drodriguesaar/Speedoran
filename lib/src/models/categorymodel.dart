import 'package:speedoran/src/models/linkmodel.dart';
import 'package:speedoran/src/models/playermodel.dart';

class CategoryModel {
  CategoryModel({
    this.id,
    this.name,
    this.weblink,
    this.type,
    this.rules,
    this.players,
    this.miscellaneous,
    this.links,
  });

  String id;
  String name;
  String weblink;
  String type;
  String rules;
  PlayerModel players;
  bool miscellaneous;
  List<LinkModel> links;

  factory CategoryModel.fromMap(Map<String, dynamic> json) => CategoryModel(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        weblink: json["weblink"] == null ? null : json["weblink"],
        type: json["type"] == null ? null : json["type"],
        rules: json["rules"] == null ? null : json["rules"],
        players: json["players"] == null
            ? null
            : PlayerModel.fromMap(json["players"]),
        miscellaneous:
            json["miscellaneous"] == null ? null : json["miscellaneous"],
        links: json["links"] == null
            ? null
            : List<LinkModel>.from(
                json["links"].map((x) => LinkModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "weblink": weblink == null ? null : weblink,
        "type": type == null ? null : type,
        "rules": rules == null ? null : rules,
        "players": players == null ? null : players.toMap(),
        "miscellaneous": miscellaneous == null ? null : miscellaneous,
        "links": links == null
            ? null
            : List<dynamic>.from(links.map((x) => x.toMap())),
      };
}
