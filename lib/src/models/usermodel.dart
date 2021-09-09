import 'dart:convert';

import 'package:speedoran/src/models/socialmediamodel.dart';
import 'package:speedoran/src/models/linkmodel.dart';
import 'package:speedoran/src/models/namesmodel.dart';
import 'package:speedoran/src/models/namestylemodel.dart';

import 'locationmodel.dart';

UserModel welcomeFromMap(String str) => UserModel.fromMap(json.decode(str));

String welcomeToMap(UserModel data) => json.encode(data.toMap());

class UserModel {
  UserModel({
    this.id,
    this.names,
    this.weblink,
    this.nameStyle,
    this.role,
    this.signup,
    this.location,
    this.twitch,
    this.hitbox,
    this.youtube,
    this.twitter,
    this.speedrunslive,
    this.links,
  });

  String id;
  NamesModel names;
  String weblink;
  NameStyleModel nameStyle;
  String role;
  DateTime signup;
  LocationModel location;
  SocialMediaModel twitch;
  SocialMediaModel hitbox;
  SocialMediaModel youtube;
  SocialMediaModel twitter;
  SocialMediaModel speedrunslive;
  List<LinkModel> links;

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        id: json["id"] == null ? null : json["id"],
        names: json["names"] == null ? null : NamesModel.fromMap(json["names"]),
        weblink: json["weblink"] == null ? null : json["weblink"],
        nameStyle: json["name-style"] == null
            ? null
            : NameStyleModel.fromMap(json["name-style"]),
        role: json["role"] == null ? null : json["role"],
        signup: json["signup"] == null ? null : DateTime.parse(json["signup"]),
        location: json["location"] == null
            ? null
            : LocationModel.fromMap(json["location"]),
        twitch: json["twitch"] == null
            ? null
            : SocialMediaModel.fromMap(json["twitch"]),
        hitbox: json["hitbox"] == null
            ? null
            : SocialMediaModel.fromMap(json["hitbox"]),
        youtube: json["youtube"] == null
            ? null
            : SocialMediaModel.fromMap(json["youtube"]),
        twitter: json["twitter"] == null
            ? null
            : SocialMediaModel.fromMap(json["twitter"]),
        speedrunslive: json["speedrunslive"] == null
            ? null
            : SocialMediaModel.fromMap(json["speedrunslive"]),
        links: json["links"] == null
            ? null
            : List<LinkModel>.from(
                json["links"].map((x) => LinkModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "names": names == null ? null : names.toMap(),
        "weblink": weblink == null ? null : weblink,
        "name-style": nameStyle == null ? null : nameStyle.toMap(),
        "role": role == null ? null : role,
        "signup": signup == null ? null : signup.toIso8601String(),
        "location": location == null ? null : location.toMap(),
        "twitch": twitch == null ? null : twitch.toMap(),
        "hitbox": hitbox == null ? null : hitbox.toMap(),
        "youtube": youtube == null ? null : youtube.toMap(),
        "twitter": twitter == null ? null : twitter.toMap(),
        "speedrunslive": speedrunslive == null ? null : speedrunslive.toMap(),
        "links": links == null
            ? null
            : List<dynamic>.from(links.map((x) => x.toMap())),
      };
}
