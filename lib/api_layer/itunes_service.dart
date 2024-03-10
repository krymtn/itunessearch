import 'package:dio/dio.dart';
import 'itunes_interceptor.dart';

class ITunesService {
  static final ITunesService _instance = ITunesService._internal();

  factory ITunesService() {
    return _instance;
  }

  final Dio _dio = Dio();
  Dio get dio => _dio;
  ITunesService._internal(){
    _dio.options = BaseOptions(baseUrl: "https://itunes.apple.com", headers: {"content-type" : "application/json"});
    _dio.interceptors.add(ItunesInterceptor());
  }
}