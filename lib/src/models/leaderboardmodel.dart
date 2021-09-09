import 'package:speedoran/src/models/linkmodel.dart';
import 'package:speedoran/src/models/runattemptmodel.dart';

class LeaderBoardModel {
  LeaderBoardModel({
    this.weblink,
    this.game,
    this.category,
    this.level,
    this.platform,
    this.region,
    this.emulators,
    this.videoOnly,
    this.timing,
    this.runs,
    this.links,
  });

  String weblink;
  String game;
  String category;
  dynamic level;
  dynamic platform;
  dynamic region;
  dynamic emulators;
  bool videoOnly;
  dynamic timing;
  List<RunAttemptModel> runs;
  List<LinkModel> links;

  factory LeaderBoardModel.fromMap(Map<String, dynamic> json) =>
      LeaderBoardModel(
        weblink: json["weblink"] == null ? null : json["weblink"],
        game: json["game"] == null ? null : json["game"],
        category: json["category"] == null ? null : json["category"],
        level: json["level"],
        platform: json["platform"],
        region: json["region"],
        emulators: json["emulators"],
        videoOnly: json["video-only"] == null ? null : json["video-only"],
        timing: json["timing"],
        runs: json["runs"] == null
            ? null
            : List<RunAttemptModel>.from(
                json["runs"].map((x) => RunAttemptModel.fromMap(x))),
        links: json["links"] == null
            ? null
            : List<LinkModel>.from(
                json["links"].map((x) => LinkModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "weblink": weblink == null ? null : weblink,
        "game": game == null ? null : game,
        "category": category == null ? null : category,
        "level": level,
        "platform": platform,
        "region": region,
        "emulators": emulators,
        "video-only": videoOnly == null ? null : videoOnly,
        "timing": timing,
        "runs": runs == null
            ? null
            : List<dynamic>.from(runs.map((x) => x.toMap())),
        "links": links == null
            ? null
            : List<dynamic>.from(links.map((x) => x.toMap())),
      };
}
