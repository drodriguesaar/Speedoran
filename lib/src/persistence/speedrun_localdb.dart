import 'dart:async';
import 'package:path/path.dart';
import 'package:speedoran/src/models/favgamemodel.dart';
import 'package:sqflite/sqflite.dart';

class SpeedrunLocalDB 
{
  static Future<Database> database;
  static Future openDB() async {
    database = openDatabase(
          join(await getDatabasesPath(), 'speedrun.db'),
          onCreate: (db, version) {
            return db.execute(
              "CREATE TABLE favgames(favGameID TEXT PRIMARY KEY, title TEXT, urlGameCover TEXT)");
          },
          version: 1,
      );
  }
  static Future deleteFavGame(String favGameID)async{
    await openDB();
    final Database db = await database;
    await db.delete('favgames', where:"favGameID = ?", whereArgs: [favGameID]);
  }
  static Future insertFavGame(FavGameModel favGame) async{
    await openDB();
    final Database db = await database;
    await db.insert(
      'favgames',
      favGame.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
  static Future<FavGameModel> getFavGame(String favGameID)async{
    await openDB();
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('favgames', 
                         columns: <String>["favGameID","title","urlGameCover"],  
                         where:"favGameID='$favGameID'", 
                         limit: 1);
    if(maps.isEmpty){
      return null;
    }
    var resultList =  List.generate(maps?.length, (i) {
      return FavGameModel(
        favGameID: maps[i]['favGameID'],
        title: maps[i]['title'],
        urlGameCover: maps[i]['urlGameCover'],
      );
    })?.first;
    return resultList;
  }

  static Future<List<FavGameModel>> getFavGames()async{
    await openDB();
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('favgames', 
                         columns: <String>["favGameID","title","urlGameCover"]);
    if(maps.isEmpty){
      return null;
    }
    var resultList =  List.generate(maps?.length, (i) {
      return FavGameModel(
        favGameID: maps[i]['favGameID'],
        title: maps[i]['title'],
        urlGameCover: maps[i]['urlGameCover'],
      );
    });
    return resultList;
  }  
}