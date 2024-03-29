part of 'suggestion_cubit.dart';

class SuggestionRepository extends BaseService {

  SuggestionRepository({Dio? dio}) : super(dio: dio);

  String prepareURL({
    required String entity,
    required String attribute,
    required String queryString,
    int? limit}) => "/search?term=$queryString&entity=$entity&attribute=$attribute&limit=${limit ?? defaultLimit}";

  Future<List<Response>> retrieveSuggestionsFor({required String searchQuery}) async {
    var responses = await Future.wait([
      client.get(prepareURL(entity: "allArtist", attribute: "allArtistTerm", queryString: searchQuery)),
      client.get(prepareURL(entity: "song", attribute: "songTerm", queryString: searchQuery)),
      client.get(prepareURL(entity: "album", attribute: "albumTerm", queryString: searchQuery))
    ]);
    return responses;
  }
}