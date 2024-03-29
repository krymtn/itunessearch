import 'package:dio/dio.dart' as dio_client;
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:itunessearchbloc/api_layer/api_layer.dart';
import 'package:itunessearchbloc/results/cubit/results_repository.dart';
import 'package:itunessearchbloc/results/models/models.dart';
import 'package:itunessearchbloc/results/models/result.dart';

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

  group("mock/kuzukuzu_songs.json results", () {
    String successPath = "test/assets/results/kuzukuzu_songs.json";
    const query = "kuzu+kuzu";
    const entity = "song";
    late dio_client.Response songResponse;

    setUp(() async {
      String responseString = await rootBundle.loadString(successPath);
      dioAdapter.onGet("/search?term=$query&entity=$entity&limit=15", (server) => server.reply(
        200,
        responseString,
        delay: const Duration(seconds: 1),
      ));
      ResultsRepository repository = ResultsRepository(dio: dio);
      songResponse = await repository.fetchOverviewSearchItemsBy(entity: Entities.song, queryText: query);
    });

    test("1. Check the pure response data", () {
      expect(songResponse.data is ItunesSearchAPIResponse, true);
      ItunesSearchAPIResponse itunesSearchAPIResponse = songResponse.data;
      expect(itunesSearchAPIResponse.resultCount, 15);
    });

    test("2. song constructor with json", () {
      ItunesSearchAPIResponse itunesSearchAPIResponse = songResponse.data;
      List<Song> songs = itunesSearchAPIResponse.results.map((e) => Song.fromJson(e)).toList();
      expect(songs.first.trackName, "Kuzu Kuzu-23");
    });

  });

  group("mock/kuzukuzu_albums.json results", () {
    String successPath = "test/assets/results/kuzukuzu_albums.json";
    const query = "kuzu+kuzu";
    const entity = "album";
    late dio_client.Response songResponse;

    setUp(() async {
      String responseString = await rootBundle.loadString(successPath);
      dioAdapter.onGet("/search?term=$query&entity=$entity&limit=15", (server) => server.reply(
        200,
        responseString,
        delay: const Duration(seconds: 1),
      ));
      ResultsRepository repository = ResultsRepository(dio: dio);
      songResponse = await repository.fetchOverviewSearchItemsBy(entity: Entities.album, queryText: query);
    });

    test("1. Check the pure response data", () {
      expect(songResponse.data is ItunesSearchAPIResponse, true);
      ItunesSearchAPIResponse itunesSearchAPIResponse = songResponse.data;
      expect(itunesSearchAPIResponse.resultCount, 15);
    });

    test("2. album constructor with json", () {
      ItunesSearchAPIResponse itunesSearchAPIResponse = songResponse.data;
      List<Album> songs = itunesSearchAPIResponse.results.map((e) => Album.fromJson(e)).toList();
      expect(songs.first.collectionName, "Kuzu Kuzu (Remixes) - EP");
    });
  });
}