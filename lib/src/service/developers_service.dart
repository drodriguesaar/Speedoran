import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:speedoran/src/utils/constants.dart';
import 'package:speedoran/src/models/developermodel.dart';

class DevelopersService {
  static Future<DeveloperModel> fetchDeveloper(String developerID) async {
    var developerUrl = '${Constants.apiUrl}developers/$developerID';
    var developerResult =
        await http.get(developerUrl, headers: Constants.headers);
    var developerJson = json.decode(developerResult.body);
    var developerModel = DeveloperModel.fromMap(developerJson['data']);
    return developerModel;
  }
}
