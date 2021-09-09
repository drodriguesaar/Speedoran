import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;
import 'package:speedoran/src/utils/constants.dart';
import 'package:speedoran/src/models/gamemodel.dart';
import 'package:speedoran/src/models/platformmodel.dart';
import 'package:speedoran/src/service/user_service.dart';
import 'package:speedoran/src/models/gameslistmodel.dart';
import 'package:speedoran/src/viewmodels/runviewmodel.dart';
import 'package:speedoran/src/viewmodels/gameviewmodel.dart';
import 'package:speedoran/src/viewmodels/userviewmodel.dart';
import 'package:speedoran/src/service/platforms_service.dart';
import 'package:speedoran/src/service/categories_service.dart';
import 'package:speedoran/src/viewmodels/categoryviewmodel.dart';
import 'package:speedoran/src/viewmodels/moderatorviewmodel.dart';

class GamesService {

  static Future<List<GameViewModel>> fetchGames(int offset) async {
    var _gamesUrlRequest = '${Constants.apiUrl}games?max=50&offset=$offset&_bulk=no&embed=players,categories,platforms,developers,publishers,moderators,regions,runs,engines,genres';
    var gamesResponse = await http.get(_gamesUrlRequest, headers: Constants.headers);
    var gamesJson = json.decode(gamesResponse.body);
    var gamesList = GamesListModel.fromMap(gamesJson);

    var gamesVMList = new List<GameViewModel>();

    for (var game in gamesList.data) {
      gamesVMList.add(new GameViewModel(
          id: game.id,
          released: game.released,
          name: game.names.international,
          cover: game.assets?.coverSmall?.uri));
    }

    return gamesVMList;
  }
  static Future<List<GameViewModel>> fetchGamesByTerm(String term, int offset) async {
    var _gamesUrlRequest = '${Constants.apiUrl}games?name=$term&max=50&offset=$offset&_bulk=no&embed=players,categories,platforms,developers,publishers,moderators,regions,runs,engines,genres';
    var gamesResponse = await http.get(_gamesUrlRequest, headers: Constants.headers);
    var gamesJson = json.decode(gamesResponse.body);
    var gamesList = GamesListModel.fromMap(gamesJson);

    var gamesVMList = new List<GameViewModel>();

    for (var game in gamesList.data) {
      gamesVMList.add(new GameViewModel(
          id: game.id,
          released: game.released,
          name: game.names.international,
          cover: game.assets?.coverSmall?.uri));
    }
    return gamesVMList;
  }
  static Future<GameViewModel> fetchGame(String gameID) async {
    var platformsNames = new List<String>();
    var developersNames = new List<String>();
    var runsPlacing = new List<RunViewModel>();
    var categoriesNames = new List<CategoryViewModel>();
    var moderatorsNames = new List<ModeratorViewModel>();

    var _gamesUrlRequest = '${Constants.apiUrl}games/$gameID?embed=players,categories.records,platforms,developers,publishers,moderators,regions,runs,engines,genres';
    var gameResult = await http.get(_gamesUrlRequest, headers: Constants.headers);
    var gameJson = json.decode(gameResult.body);
    var gameModel = GameModel.fromMap(gameJson['data']);
    
    for (var category in gameModel.categories) {
      categoriesNames.add(new CategoryViewModel(category.name, category.id));
    }

    var categoryID = categoriesNames.first.id;
    var categoriesRecords = await CategoriesService.fetchCategoryRecords(categoryID);

    for(var run in categoriesRecords.data.first.runs.take(3)) {
      var result = await Future.wait([
        UserService.fetchUser(run.run.players.first.id),
        PlatformsService.fetchPlatform(run.run.system.platform)
      ]);
      var playerResult = result[0] as UserViewModel;
      var platformResult = result[1] as PlatformModel;     
      runsPlacing.add(new RunViewModel(
        place: run.place,
        comment: run.run?.comment,
        video: run.run?.videos?.links?.first?.uri,
        time: run.run.times.realtime,
        player: playerResult.name,
        nameColor: playerResult.nameColor,
        platform: platformResult.name,
        runnerID: playerResult.id
      ));
    }

    for (var platform in gameModel.platforms) {
      platformsNames.add(platform.name);
    }

    for (var developer in gameModel.developers) {
      developersNames.add(developer.name);
    }

    for (var mod in gameModel.moderators) {
      moderatorsNames
        .add(new ModeratorViewModel(
          mod.id,
          mod?.names?.international, 
          mod?.role, 
          LinearGradient(colors: 
            mod?.nameStyle?.style == "gradient" ?    
          [HexColor(mod?.nameStyle?.colorFrom?.light), HexColor(mod?.nameStyle?.colorTo?.dark)] : 
          [HexColor(mod?.nameStyle?.color?.light), HexColor(mod?.nameStyle?.color?.dark)]),
          mod?.location?.country?.names?.international,
          [
            mod.twitch?.uri,
            mod.hitbox?.uri,
            mod.speedrunslive?.uri,
            mod.twitter?.uri,
            mod.youtube?.uri
          ]
      ));
    }

    var gameVM = new GameViewModel(
        id: gameModel.id,
        cover: gameModel.assets.coverLarge.uri,
        name: gameModel.names.international,
        released: gameModel.released,
        developers: developersNames,
        platforms: platformsNames,
        abbrv: gameModel.abbreviation,
        moderators: moderatorsNames,
        categories: categoriesNames,
        runs: runsPlacing,
        weblink: gameModel.weblink);
    return gameVM;
  }

  static Future<GameViewModel> fetchGameSerie(String serieID) async {
    var serieURLRequest = '${Constants.apiUrl}series/$serieID?embed=moderators';
    var serieResponse = await http.get(serieURLRequest,headers: Constants.headers);
    var serieJson = json.decode(serieResponse.body);
    var serie = GameModel.fromMap(serieJson["data"]);

    var serieResult = new GameViewModel(
      id: serie.id,
      released: serie.released,
      name: serie.names.international,
      cover: serie.assets?.coverLarge?.uri,
      moderators: serie.moderators.map((e) => new ModeratorViewModel(
        e.id,
        e.names.international,
        e.role,
        LinearGradient(colors: 
            e?.nameStyle?.style == "gradient" ?    
          [HexColor(e?.nameStyle?.colorFrom?.light), HexColor(e?.nameStyle?.colorTo?.dark)] : 
          [HexColor(e?.nameStyle?.color?.light), HexColor(e?.nameStyle?.color?.dark)]),
        e?.location?.country?.names?.international,
        [
            e.twitch?.uri,
            e.hitbox?.uri,
            e.speedrunslive?.uri,
            e.twitter?.uri,
            e.youtube?.uri
          ]
      )).toList()
    );

    return serieResult;
  }
  static Future<List<GameViewModel>> fetchGameSeries(int offset) async {
    var _gamesUrlRequest = '${Constants.apiUrl}series?max=50&offset=$offset&_bulk=no&embed=players,categories,platforms,developers,publishers,moderators,regions,runs,engines,genres';
    var gamesResponse = await http.get(_gamesUrlRequest, headers: Constants.headers);
    var gamesJson = json.decode(gamesResponse.body);
    var gamesList = GamesListModel.fromMap(gamesJson);

    var gamesVMList = new List<GameViewModel>();

    for (var game in gamesList.data) {
      gamesVMList.add(new GameViewModel(
          id: game.id,
          released: game.released,
          name: game.names.international,
          cover: game.assets?.coverSmall?.uri));
    }
    return gamesVMList;
  }  
  static Future<List<GameViewModel>> fetchGameSerieGames(String serieID, int offset) async {
    var _gamesUrlRequest = '${Constants.apiUrl}series/$serieID/games?max=50&offset=$offset&embed=platforms,developers';
    var gamesResponse = await http.get(_gamesUrlRequest, headers: Constants.headers);
    var gamesJson = json.decode(gamesResponse.body);
    var gamesList = GamesListModel.fromMap(gamesJson);

    var gamesVMList = new List<GameViewModel>();

    for (var game in gamesList.data) {
      gamesVMList.add(new GameViewModel(
          id: game.id,
          released: game.released,
          name: game.names.international,
          cover: game.assets?.coverSmall?.uri));
    }
    return gamesVMList;
  }
  static Future<List<GameViewModel>> fetchGameSeriesByTerm(String term, int offset) async {
    var _gamesUrlRequest = '${Constants.apiUrl}series?name=$term&max=50&offset=$offset';
    var gamesResponse = await http.get(_gamesUrlRequest, headers: Constants.headers);
    var gamesJson = json.decode(gamesResponse.body);
    var gamesList = GamesListModel.fromMap(gamesJson);

    var gamesVMList = new List<GameViewModel>();

    for (var game in gamesList.data) {
      gamesVMList.add(new GameViewModel(
          id: game.id,
          released: game.released,
          name: game.names.international,
          cover: game.assets?.coverSmall?.uri));
    }
    return gamesVMList;
  }
}
