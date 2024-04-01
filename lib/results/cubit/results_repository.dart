part of 'results_cubit.dart';

class ResultsRepository extends BaseService {
  ResultsRepository({Dio? dio}) : super(dio: dio);

  @override
  int get defaultLimit => 15;

  Future<Response> fetchOverviewSearchItemsBy({required Entities entity, required String queryText, int? limit}) async {
    Response response = await client.get("/search", queryParameters: {"term": queryText, "entity": entity.value, "limit": limit ?? defaultLimit});
    return response;
  }
}
