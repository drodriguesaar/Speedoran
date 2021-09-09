import 'package:http/http.dart' as http;
import 'package:speedoran/src/utils/constants.dart';

class RecordsService {
  static Future<http.Response> fetchRecords() async {
    var _gamesUrlRequest = '${Constants.apiUrl}records';
    return http.get(_gamesUrlRequest, headers: Constants.headers);
  }
}
