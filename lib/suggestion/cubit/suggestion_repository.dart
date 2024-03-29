part of 'suggestion_cubit.dart';

class SuggestionRepository extends BaseService {
  static const int limit = 5;

  SuggestionRepository({Dio? dio}) : super(dio: dio);

  String prepareURL({
    required String entity,
    required String attribute,
    required String queryString,
    int limit = limit}) => "/search?term=$queryString&entity=$entity&attribute=$attribute&limit=$limit";

  Future<List<Response>> retrieveSuggestionsFor({required String searchQuery}) async {
    var responses = await Future.wait([
      client.get(prepareURL(entity: "allArtist", attribute: "allArtistTerm", queryString: searchQuery)),
      client.get(prepareURL(entity: "song", attribute: "songTerm", queryString: searchQuery)),
      client.get(prepareURL(entity: "album", attribute: "albumTerm", queryString: searchQuery))
    ]);
    return responses;
  }
}

/*var response2s = await Future.wait([
      client.get(
          "/search?term=$searchQuery&entity=allArtist&attribute=allArtistTerm&limit=5"),
      client.get(
          "/search?term=$searchQuery&entity=song&attribute=songTerm&limit=5"),
      client.get(
          "/search?term=$searchQuery&entity=album&attribute=albumTerm&limit=5")
    ]);*/