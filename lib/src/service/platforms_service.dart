import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:speedoran/src/utils/constants.dart';
import 'package:speedoran/src/models/gamemodel.dart';
import 'package:speedoran/src/models/platformmodel.dart';

class PlatformsService {
  static Future<PlatformModel> fetchPlatform(String platformID) async {
    var requestUrl = "${Constants.apiUrl}platforms/$platformID";
    var platformResult = await http.get(requestUrl, headers: Constants.headers);
    var platformJson = json.decode(platformResult.body);
    var platformModel = PlatformModel.fromMap(platformJson['data']);
    return platformModel;
  }

  static Future<List<PlatformModel>> fetchPlatforms(int offset) async {
    var requestUrl = "${Constants.apiUrl}platforms?offset=$offset&max=20";
    var platformResult = await http.get(requestUrl, headers: Constants.headers);
    var platformJson = json.decode(platformResult.body);
    var platformModel = List<PlatformModel>.from(platformJson['data'].map((e)=> 
      PlatformModel.fromMap(e)
    ));
    return platformModel;
  }

  static Future<List<GameModel>> fetchPlatformGames(String platformID)async
  {
    var requestUrl = "${Constants.apiUrl}games?platform=$platformID&embed=players,categories,platforms,developers,publishers,moderators,regions,runs,engines,genres";
    var platformResult = await http.get(requestUrl, headers: Constants.headers);
    var platformJson = json.decode(platformResult.body);
    var gamesModel = List<GameModel>.from(platformJson['data'].map((e)=> 
      GameModel.fromMap(e)
    ));
    return gamesModel;
  }
}
