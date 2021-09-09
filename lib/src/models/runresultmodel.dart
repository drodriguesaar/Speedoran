import 'package:speedoran/src/models/playermodel.dart';
import 'package:speedoran/src/models/statusmodel.dart';
import 'package:speedoran/src/models/systemmodel.dart';
import 'package:speedoran/src/models/timesmodel.dart';
import 'package:speedoran/src/models/videosmodel.dart';

class RunResultModel {
  RunResultModel(
      {this.id,
      this.weblink,
      this.game,
      this.level,
      this.category,
      this.videos,
      this.comment,
      this.status,
      this.players,
      this.date,
      this.submitted,
      this.times,
      this.system});

  String id;
  String weblink;
  String game;
  dynamic level;
  String category;
  VideosModel videos;
  dynamic comment;
  StatusModel status;
  List<PlayerModel> players;
  DateTime date;
  DateTime submitted;
  TimesModel times;
  SystemModel system;

  factory RunResultModel.fromMap(Map<String, dynamic> json) => RunResultModel(
      id: json["id"] == null ? null : json["id"],
      weblink: json["weblink"] == null ? null : json["weblink"],
      game: json["game"] == null ? null : json["game"],
      level: json["level"],
      category: json["category"] == null ? null : json["category"],
      videos:
          json["videos"] == null ? null : VideosModel.fromMap(json["videos"]),
      comment: json["comment"],
      status:
          json["status"] == null ? null : StatusModel.fromMap(json["status"]),
      players: json["players"] == null
          ? null
          : List<PlayerModel>.from(
              json["players"].map((x) => PlayerModel.fromMap(x))),
      date: json["date"] == null ? null : DateTime.parse(json["date"]),
      submitted:
          json["submitted"] == null ? null : DateTime.parse(json["submitted"]),
      times: json["times"] == null ? null : TimesModel.fromMap(json["times"]),
      system:
          json["system"] == null ? null : SystemModel.fromMap(json["system"]));

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "weblink": weblink == null ? null : weblink,
        "game": game == null ? null : game,
        "level": level,
        "category": category == null ? null : category,
        "videos": videos == null ? null : videos.toMap(),
        "comment": comment,
        "status": status == null ? null : status.toMap(),
        "players": players == null
            ? null
            : List<dynamic>.from(players.map((x) => x.toMap())),
        "date": date == null
            ? null
            : "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
        "submitted": submitted == null ? null : submitted.toIso8601String(),
        "times": times == null ? null : times.toMap(),
        "system": system == null ? null : system.toMap()
      };
}
