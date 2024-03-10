import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../api_layer/base_service.dart';

class SearchRepository extends BaseService {
  SearchRepository({Dio? dio}) : super(dio: dio);

  Future<Response> fetchResultsBy({required String searchQuery}) async {
    // jack+johnson
    return await client.get("https://itunes.apple.com/search?term=$searchQuery");
  }

}