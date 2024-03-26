import 'package:dio/dio.dart';
import '../api_layer/base_service.dart';

class SearchRepository extends BaseService {
  SearchRepository({Dio? dio}) : super(dio: dio);

  Future<List<Response>> fetchResultsBy({required String searchQuery}) async {
    var responses = await Future.wait([
      client.get("/search?term=$searchQuery&entity=allArtist&attribute=allArtistTerm&limit=5"),
      client.get("/search?term=$searchQuery&entity=song&attribute=songTerm&limit=5"),
      client.get("/search?term=$searchQuery&entity=album&attribute=albumTerm&limit=5")
    ]);

    return responses;


    //return await client.get("/search?term=$searchQuery&limit=20");
  }




}