import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:itunessearchbloc/api_layer/itunes_interceptor.dart';
import 'package:itunessearchbloc/search/search_repository.dart';
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late Dio dio;
  late DioAdapter dioAdapter;
  const baseUrl = 'https://example.com';
  setUp(() {
    dio = Dio(BaseOptions(baseUrl: baseUrl));
    dio.interceptors.add(ItunesInterceptor());
    dioAdapter = DioAdapter(dio: dio);
  });

  test("mock search?term endpoint on fetchResultsBy", () async {
    String successPath = "test/assets/jack_johnson_results.json";
    String responseString = await rootBundle.loadString(successPath);

    const query = "jack+johnson";
    dioAdapter.onGet("/search?term=$query", (server) => server.reply(
      200,
      responseString,
      delay: const Duration(seconds: 1),
    ));

    SearchRepository searchRepository = SearchRepository(dio: dio);
    var _ = await searchRepository.fetchResultsBy(searchQuery: query);
    //expect(searchResponse.data is ItunesSearchAPIResponseData, true);
    //ItunesSearchAPIResponseData data = searchResponse.data;
    //expect(data.resultCount, 49);
    //expect(data.results.first.trackName, "Star Wars: The Force Awakens");
  });
}