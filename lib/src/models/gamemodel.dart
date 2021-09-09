import 'package:speedoran/src/models/categorymodel.dart';
import 'package:speedoran/src/models/developermodel.dart';
import 'package:speedoran/src/models/linkmodel.dart';
import 'package:speedoran/src/models/namesmodel.dart';
import 'package:speedoran/src/models/assetsmodel.dart';
import 'package:speedoran/src/models/platformmodel.dart';
import 'package:speedoran/src/models/usermodel.dart';

class GameModel {
  GameModel(
      {this.id,
      this.names,
      this.abbreviation,
      this.weblink,
      this.released,
      this.releaseDate,
      this.assets,
      this.links,
      this.platforms,
      this.developers,
      this.moderators,
      this.romhack,
      this.categories});

  String id;
  NamesModel names;
  String abbreviation;
  String weblink;
  int released;
  DateTime releaseDate;
  AssetModel assets;
  List<LinkModel> links;
  bool romhack;
  List<PlatformModel> platforms;
  List<DeveloperModel> developers;
  List<UserModel> moderators;
  List<CategoryModel> categories;


  factory GameModel.fromMap(Map<String, dynamic> json) {

    bool hasntPlatforms = (json["platforms"] == null || json["platforms"]["data"] == null);
    bool hasntdevelopers = (json["developers"] == null || json["developers"]["data"] == null);
    bool hasntModerators = (json["moderators"] == null || json["moderators"]["data"] == null);
    bool hasntCategories = (json["categories"] == null || json["categories"]["data"] == null);

    return GameModel(
      id: json["id"] == null ? null : json["id"],
      names: json["names"] == null ? null : NamesModel.fromMap(json["names"]),
      abbreviation: json["abbreviation"] == null ? null : json["abbreviation"],
      weblink: json["weblink"] == null ? null : json["weblink"],
      released: json["released"] == null ? null : json["released"],
      releaseDate: json["release-date"] == null ? null : DateTime.parse(json["release-date"]),
      assets: json["assets"] == null ? null : AssetModel.fromMap(json["assets"]),
      links: json["links"] == null? null : List<LinkModel>.from(json["links"].map((x) => LinkModel.fromMap(x))),
      platforms: hasntPlatforms ? null : List<PlatformModel>.from(json["platforms"]["data"].map((x) => PlatformModel.fromMap(x))),
      developers:  hasntdevelopers ? null : List<DeveloperModel>.from(json["developers"]["data"].map((x) => DeveloperModel.fromMap(x))),
      moderators: hasntModerators ? null : List<UserModel>.from(json["moderators"]["data"].map((x) => UserModel.fromMap(x))),
      categories: hasntCategories ? null : List<CategoryModel>.from(json["categories"]["data"].map((x)=> CategoryModel.fromMap(x)))
  );
  }

  bool hasDevelopers(Map<String,dynamic>json ){
    if(!json.containsKey("developers")){
      return false;
    }
    else if(json["developers"].asMap().containsKey("data")){
      return false;
    }
    else 
      return false;
  }


  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "names": names == null ? null : names.toMap(),
        "abbreviation": abbreviation == null ? null : abbreviation,
        "weblink": weblink == null ? null : weblink,
        "released": released == null ? null : released,
        "release-date": releaseDate == null
            ? null
            : "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "assets": assets == null ? null : assets.toMap(),
        "links": links == null
            ? null
            : List<dynamic>.from(links.map((x) => x.toMap())),
        "platforms": platforms == null
            ? null
            : List<dynamic>.from(platforms.map((x) => x)),
        "developers": developers == null
            ? null
            : List<dynamic>.from(developers.map((x) => x)),
        "categories": categories == null
            ? null
            : List<dynamic>.from(categories.map((x) => x)),
      };
}
