import 'dart:convert';
import 'api_layer.dart';

class ItunesSearchAPIResponse {
  late int resultCount;
  late List<dynamic> results;
  ItunesSearchAPIResponse({required this.resultCount, required this.results});

  ItunesSearchAPIResponse.initDioResponse({required Response response}) {
    var responseData = jsonDecode(response.data);
    resultCount = responseData["resultCount"];
    results = responseData["results"];
  }
}