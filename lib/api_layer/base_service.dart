import 'api_layer.dart';

abstract class BaseService {
  int get defaultLimit => 5;
  late Dio client;
  BaseService({required Dio? dio}) {
    if (dio != null) {
      client = dio;
    } else {
      ITunesService iTunesService = ITunesService();
      client = iTunesService.dio;
    }
  }
}