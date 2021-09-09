import 'package:speedoran/src/models/categorymodel.dart';
import 'package:speedoran/src/models/gamemodel.dart';
import 'package:speedoran/src/models/runresultmodel.dart';

class PersonalBestModel
{
  PersonalBestModel({
    this.place,
    this.run,
    this.game,
    this.category
  });


  int place;
  RunResultModel run;
  GameModel game;
  CategoryModel category;

  factory PersonalBestModel.fromMap(Map<String,dynamic> json)=>
    PersonalBestModel(
      place: json["place"] == null ? null : json["place"],
      run: json["run"] == null ? null : RunResultModel.fromMap(json["run"]),
      game: json["game"] == null ? null : GameModel.fromMap(json["game"]["data"]),
      category: json["category"] == null ? null : CategoryModel.fromMap(json["category"])
    );

}