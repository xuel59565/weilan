import 'package:dio/dio.dart';

import 'http_method.dart';

class DioInstance {
  static DioInstance? _instance;

  DioInstance._();

  static DioInstance instance() {
    return _instance ??= DioInstance._();
  }

  final Dio _dio = Dio();
  final _defaultTime = const Duration(seconds: 30);

  void initDio({
    required String baseUrl,
    String? httpMethod = HttpMethod.GET,
    Duration? connectTimeout,
    Duration? receiveTimeout,
    Duration? sendTimeout,
    ResponseType? responseType = ResponseType.json,
    String? contentType,
  }) {
    _dio.options = BaseOptions(
      method: httpMethod,
      baseUrl: baseUrl,
      connectTimeout: connectTimeout ?? _defaultTime,
      receiveTimeout: receiveTimeout ?? _defaultTime,
      sendTimeout: sendTimeout ?? _defaultTime,
      responseType: responseType,
      contentType: contentType,
    );
  }

  Future<Response> get({
    required String path,
    Map<String, dynamic>? param,
    Options? options,
    CancelToken? cancelToken, //取消当前这次请求
    ProgressCallback? onReceiveProgress,
  }) async {
    return await _dio.get(
      path,
      queryParameters: param,
      options: options ??
          Options(
              method: HttpMethod.GET,
              receiveTimeout: _defaultTime,
              sendTimeout: _defaultTime),
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
  }

  Future<Response> post({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return await _dio.post(path,
        data: data,
        queryParameters: queryParameters,
        options: options ??
            Options(
                method: HttpMethod.POST,
                receiveTimeout: _defaultTime,
                sendTimeout: _defaultTime));
  }
}
