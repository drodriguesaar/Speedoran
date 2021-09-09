import 'dart:convert';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:speedoran/src/utils/constants.dart';
import 'package:speedoran/src/models/gamemodel.dart';
import 'package:speedoran/src/models/usermodel.dart';
import 'package:speedoran/src/models/categorymodel.dart';
import 'package:speedoran/src/models/namestylemodel.dart';
import 'package:speedoran/src/models/runresultmodel.dart';
import 'package:speedoran/src/models/userslistmodel.dart';
import 'package:speedoran/src/models/personalbestmodel.dart';
import 'package:speedoran/src/viewmodels/userviewmodel.dart';

class UserService {
  ///Get an user based on it's user ID
  ///
  ///Returns a instance of [UserViewModel] as a result.
  ///The [userID] paramter is required
  static Future<UserViewModel> fetchUser(String userID) async {
    if (userID == null || userID.isEmpty) {
      throw Exception("The provided user ID is null or empty");
    }

    var userUrl = '${Constants.apiUrl}users/$userID';
    var httpResult = await http.get(userUrl, headers: Constants.headers);
    var userJson = json.decode(httpResult.body);
    var userModel = UserModel.fromMap(userJson["data"]);


    

    if (userModel == null) {
      throw Exception("User not found");
    }

    return new UserViewModel(
        id: userModel?.id,
        role: userModel?.role,
        nameColor: getUserColorName(userModel?.nameStyle),
        name: userModel?.names?.international,
        country: userModel?.location?.country?.names?.international,
        userLink: userModel?.weblink,
        socialMedia: getSocialMediaLinks(userModel));
  }

  ///Get a list of users
  ///
  ///Returns a instance of [List<UserViewModel>] as a result.
  ///The [offset] paramter is required
  static Future<List<UserViewModel>> fechUsers(int offset) async {
    var userUrl = '${Constants.apiUrl}users?offset=$offset&max=50';
    var httpResult = await http.get(userUrl, headers: Constants.headers);
    var usersJson = json.decode(httpResult.body);
    var usersModel = UsersListModel.fromMap(usersJson);

    var usersVMList = usersModel.data.map((userModel) {
      return new UserViewModel(
          id: userModel?.id,
          role: userModel?.role,
          nameColor: getUserColorName(userModel?.nameStyle),
          name: formatUserName(userModel?.names?.international),
          country: userModel?.location?.country?.names?.international,
          userLink: userModel?.weblink,
          socialMedia: getSocialMediaLinks(userModel));
    }).toList();
    return usersVMList;
  }

  static Future<List<PersonalBestModel>> fetchUserPersonalBests(String userID) async {
    var userPB = '${Constants.apiUrl}users/$userID/personal-bests?embed=game.platforms,game.developers,game.categories,category&top=3';
    var userPBResult = await http.get(userPB, headers: Constants.headers);
    var userPBRJson = json.decode(userPBResult.body);
   
    var personalBests = List<PersonalBestModel>.from(userPBRJson["data"].map((pbs){
     return new PersonalBestModel(
        place: pbs["place"],
        run: RunResultModel.fromMap(pbs["run"]),
        game: GameModel.fromMap(pbs["game"]["data"]),
        category: CategoryModel.fromMap(pbs["category"]["data"])
      );
    }));

    return personalBests;
  }

  static Future<List<UserViewModel>> fetchUsersByTerm(String searchTerm, int offset) async {
    var userUrl = '${Constants.apiUrl}users?name=$searchTerm';
    var httpResult = await http.get(userUrl, headers: Constants.headers);
    var userJson = json.decode(httpResult.body);
    var userModel = UsersListModel.fromMap(userJson);

    var users = List<UserViewModel>.from((userModel.data.map((e){
      return new UserViewModel(
        id: e.id, 
        role: null, 
        name: e.names?.international, 
        country: e.location?.country?.names?.international, 
        userLink: null, 
        nameColor: getUserColorName(e.nameStyle), 
        socialMedia: getSocialMediaLinks(e));
    })));

    return users;
  }

  /// Retrieve all the social media links from the user.
  /// The [userModel] required.
  static Map<String, String> getSocialMediaLinks(UserModel userModel) {
    var socialMediaLink = 
      {
        "twitch": userModel.twitch?.uri,
        "hitbox": userModel.hitbox?.uri,
        "twitter": userModel.twitter?.uri,
        "youtube": userModel.youtube?.uri,
        "speedrunslive": userModel.speedrunslive?.uri
      };
    
    return socialMediaLink;
  }

  static String formatUserName(String name) {
    return name.replaceAll("--", "");
  }

  /// Retrieve the color of the user name.
  ///
  /// When the color style is solid, it returns a LinearGradient with only one type of color,
  /// if it is gradient, it returns a LinearGradiente with the colors from and to.
  ///
  /// The [userModel] required.
  static LinearGradient getUserColorName(NameStyleModel colorStyle) {
    List<Color> usercolors = new List<Color>();

    switch (colorStyle.style) {
      case "solid":
        usercolors.addAll(
            [HexColor(colorStyle.color.dark), HexColor(colorStyle.color.dark)]);
        break;
      case "gradient":
        usercolors.addAll([
          HexColor(colorStyle.colorFrom.dark),
          HexColor(colorStyle.colorTo.dark)
        ]);

        break;
    }
    var userColor = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment(0.0, 0.0),
        tileMode: TileMode.repeated,
        colors: usercolors);
    return userColor;
  }
}
