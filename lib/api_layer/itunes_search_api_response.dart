import 'dart:convert';
import 'package:dio/dio.dart' as dio;
import '../base_result_dto.dart';

class ItunesSearchAPIResponseData {
  late int resultCount;
  late List<Result> results;
  ItunesSearchAPIResponseData({required this.resultCount, required this.results});

  ItunesSearchAPIResponseData.initDioResponse({required dio.Response response}) {
    var responseData = jsonDecode(response.data);
    resultCount = responseData["resultCount"];
    List<dynamic> dataList = responseData["results"];
    results = dataList.map((data) => Result.fromJson(data)).toList();
  }
}