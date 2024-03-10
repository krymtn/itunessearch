import 'package:dio/dio.dart';
import 'itunes_service.dart';

abstract class BaseService {
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