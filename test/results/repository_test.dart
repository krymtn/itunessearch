import 'package:dio/dio.dart' as dio_client;
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:itunessearchbloc/api_layer/api_layer.dart';
import 'package:itunessearchbloc/results/cubit/results_cubit.dart';
import 'package:itunessearchbloc/results/models/models.dart';

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
    String entityValue = Entities.song.value;
    late dio_client.Response songResponse;

    setUp(() async {
      String responseString = await rootBundle.loadString(successPath);
      dioAdapter.onGet("/search", queryParameters: {"term": query, "entity": entityValue, "limit": 15}, (server) => server.reply(
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
    String entityValue = Entities.album.value;
    late dio_client.Response albumResponse;

    setUp(() async {
      String responseString = await rootBundle.loadString(successPath);
      dioAdapter.onGet("/search", queryParameters: {"term": query, "entity": entityValue, "limit": 15}, (server) => server.reply(
        200,
        responseString,
        delay: const Duration(seconds: 1),
      ));
      ResultsRepository repository = ResultsRepository(dio: dio);
      albumResponse = await repository.fetchOverviewSearchItemsBy(entity: Entities.album, queryText: query);
    });

    test("1. Check the pure response data", () {
      expect(albumResponse.data is ItunesSearchAPIResponse, true);
      ItunesSearchAPIResponse itunesSearchAPIResponse = albumResponse.data;
      expect(itunesSearchAPIResponse.resultCount, 15);
    });

    test("2. album constructor with json", () {
      ItunesSearchAPIResponse itunesSearchAPIResponse = albumResponse.data;
      List<Album> songs = itunesSearchAPIResponse.results.map((e) => Album.fromJson(e)).toList();
      expect(songs.first.collectionName, "Kuzu Kuzu (Remixes) - EP");
    });
  });

  group("mock/kuzukuzu_musicvideos.json results", () {
    String successPath = "test/assets/results/kuzukuzu_musicvideos.json";
    const query = "kuzu+kuzu";
    String entityValue = Entities.musicVideo.value;
    late dio_client.Response musicVideoResponse;

    setUp(() async {
      String responseString = await rootBundle.loadString(successPath);
      dioAdapter.onGet("/search", queryParameters: {"term": query, "entity": entityValue, "limit": 15}, (server) => server.reply(
        200,
        responseString,
        delay: const Duration(seconds: 1),
      ));
      ResultsRepository repository = ResultsRepository(dio: dio);
      musicVideoResponse = await repository.fetchOverviewSearchItemsBy(entity: Entities.musicVideo, queryText: query);
    });

    test("1. Check the pure response data", () {
      expect(musicVideoResponse.data is ItunesSearchAPIResponse, true);
      ItunesSearchAPIResponse itunesSearchAPIResponse = musicVideoResponse.data;
      expect(itunesSearchAPIResponse.resultCount, 2);
    });

    test("2. album constructor with json", () {
      ItunesSearchAPIResponse itunesSearchAPIResponse = musicVideoResponse.data;
      List<MusicVideo> musicVideos = itunesSearchAPIResponse.results.map((e) => MusicVideo.fromJson(e)).toList();
      expect(musicVideos.first.artistName, "t-Ace");
    });
  });
}