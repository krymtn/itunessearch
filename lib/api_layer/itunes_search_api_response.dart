import 'dart:convert';
import 'package:dio/dio.dart' as dio;
import '../search/models/search_result_dto.dart';

class ItunesSearchAPIResponseData {
  late int resultCount;
  late List<SearchResultDTO> results;
  ItunesSearchAPIResponseData({required this.resultCount, required this.results});

  ItunesSearchAPIResponseData.initDioResponse({required dio.Response response}) {
    // Expected json body is {"resultCount":1, "results": [] }
    var responseData = jsonDecode(response.data);
    resultCount = responseData["resultCount"];
    List<dynamic> dataList = responseData["results"];
    results = dataList.map((data) => SearchResultDTO.fromJson(data)).toList();
  }
}