import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:speedoran/src/utils/constants.dart';
import 'package:speedoran/src/models/runresultmodel.dart';

class RunsService {
  static Future<RunResultModel> fecthRun(String runID) async {
    var runsUrl = '${Constants.apiUrl}runs/$runID';
    var runResult = await http.get(runsUrl, headers: Constants.headers);
    var runJson = json.decode(runResult.body);
    var run = RunResultModel.fromMap(runJson['data']);
    return run;
  }

  static Future<http.Response> fecthRunPlayers(String runID) async {
    var runsUrl = '${Constants.apiUrl}runs/$runID/players';
    return http.get(runsUrl, headers: Constants.headers);
  }

  static Future<http.Response> fecthRuns() async {
    var runsUrl = '${Constants.apiUrl}runs';
    return http.get(runsUrl, headers: Constants.headers);
  }
}
