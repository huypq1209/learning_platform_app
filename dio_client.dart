import 'package:dio/dio.dart';
import 'package:flutter_application_1/dio/dio_endpoint.dart';

class DioClient {
  static BaseOptions options = new BaseOptions(
    baseUrl: Endpoints.baseUrl,
    connectTimeout: Endpoints.connectionTimeout,
    receiveTimeout: Endpoints.receiveTimeout,
  );
  Dio _dio = Dio(options);

  Future<dynamic> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response.data;
    } catch (e) {
      throw e;
    }
  }

  // Future<dynamic> post(
  //   String uri, {
  //   data,
  //   Map<String, dynamic> queryParameters,
  //   Options options,
  //   CancelToken cancelToken,
  //   ProgressCallback onSendProgress,
  //   ProgressCallback onReceiveProgress,
  // }) async {
  //   final Response response = await _dio.post(
  //     uri,
  //     data: data,
  //     queryParameters: queryParameters,
  //     options: options,
  //     cancelToken: cancelToken,
  //     onSendProgress: onSendProgress,
  //     onReceiveProgress: onReceiveProgress,
  //   );
  //   return response.data;
  // }
}
