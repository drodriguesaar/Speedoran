import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:speedoran/src/utils/constants.dart';
import 'package:speedoran/src/models/categorymodel.dart';
import 'package:speedoran/src/models/platformmodel.dart';
import 'package:speedoran/src/service/user_service.dart';
import 'package:speedoran/src/models/recordlistmodel.dart';
import 'package:speedoran/src/viewmodels/runviewmodel.dart';
import 'package:speedoran/src/viewmodels/userviewmodel.dart';
import 'package:speedoran/src/models/categorylistmodel.dart';
import 'package:speedoran/src/service/platforms_service.dart';

class CategoriesService {
  static Future<CategoryListModel> fecthGameCategory(String gameID) async {
    var _categoryUrlRequest = '${Constants.apiUrl}games/$gameID/categories';
    var categoryResult = await http.get(_categoryUrlRequest, headers: Constants.headers);
    var categoryJson = json.decode(categoryResult.body);
    var categoryModel = CategoryListModel.fromMap(categoryJson);
    return categoryModel;
  }

  static Future<CategoryModel> fetchCategory(String categoryID) async {
    var _categoryUrlRequest = '${Constants.apiUrl}categories/$categoryID';
    var categoryResult = await http.get(_categoryUrlRequest, headers: Constants.headers);
    var categoryJson = json.decode(categoryResult.body);
    var categoryModel = CategoryModel.fromMap(categoryJson);
    return categoryModel;
  }

  static Future<RecordListModel> fetchCategoryRecords(String categoryID) async {
    var _categoryUrlRequest = '${Constants.apiUrl}categories/$categoryID/records?top=3';
    var categoryListResult = await http.get(_categoryUrlRequest, headers: Constants.headers);
    var categoryListJson = json.decode(categoryListResult.body);
    var categoryListModel = RecordListModel.fromMap(categoryListJson);
    return categoryListModel;
  }

  static Future<List<RunViewModel>> fetchCategoryRuns(String categoryID) async{
    var _categoryUrlRequest = '${Constants.apiUrl}categories/$categoryID/records?top=3';
    var categoryListResult = await http.get(_categoryUrlRequest, headers: Constants.headers);
    var categoryListJson = json.decode(categoryListResult.body);
    var categoryListModel = RecordListModel.fromMap(categoryListJson);

    var runsPlacing = new List<RunViewModel>();

    for(var run in categoryListModel.data.first.runs.take(3)){
      var result = await  Future.wait([
        UserService.fetchUser(run.run.players.first.id),
        PlatformsService.fetchPlatform(run.run.system.platform)
      ]);

      var playerResult = result[0] as UserViewModel;
      var platformResult = result[1] as PlatformModel;
      
      runsPlacing.add(new RunViewModel(
        place: run.place,
        comment: run.run?.comment,
        video: run.run?.videos?.links?.first?.uri,
        time: run.run.times.primary,
        player: playerResult.name,
        nameColor: playerResult.nameColor,
        platform: platformResult.name
      ));
    }
    return runsPlacing;
  }
}
