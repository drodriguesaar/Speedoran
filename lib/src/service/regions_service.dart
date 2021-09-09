import 'package:http/http.dart' as http;
import 'package:speedoran/src/utils/constants.dart';

class RegionsService {
  static Future<http.Response> fetchRegions() async {
    var requestUrl = '${Constants.apiUrl}regions';
    return http.get(requestUrl, headers: Constants.headers);
  }

  static Future<http.Response> fetchRegion(String regionID) async {
    var requestUrl = '${Constants.apiUrl}regions/$regionID';
    return http.get(requestUrl, headers: Constants.headers);
  }
}
