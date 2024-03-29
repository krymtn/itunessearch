import 'package:dio/dio.dart';
import '../../api_layer/base_service.dart';
import '../models/models.dart';

class ResultsRepository extends BaseService {
  ResultsRepository({Dio? dio}) : super(dio: dio);

  @override
  int get defaultLimit => 15;

  String prepareURL({
    required String entity,
    required String queryString,
    int? limit}) => "/search?term=$queryString&entity=$entity&limit=${limit ?? defaultLimit}";

  Future<Response> fetchOverviewSearchItemsBy({required Entities entity, required String queryText}) async {
    Response response = await client.get(prepareURL(entity: entity.value, queryString: queryText));
    return response;
  }
}