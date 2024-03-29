import 'package:flutter/foundation.dart';
import 'api_layer.dart';

class ItunesInterceptor implements Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      print(options.uri);
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    try {
      response.data = ItunesSearchAPIResponse.initDioResponse(response: response);
      return handler.next(response);
    } catch (error) {
      return handler.reject(
          DioException(
            requestOptions: response.requestOptions,
            type: DioExceptionType.unknown,
            message: "Unexpected response body: ${error.toString()}"
          ));
    }
  }
}