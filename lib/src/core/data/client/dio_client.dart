import 'package:dio/dio.dart';

import '../../../config/constaints/network_constaints.dart';

class DioClient {
  final String baseUrl;
  DioClient(this.baseUrl) : dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: CONNECT_TIME_OUT,
      receiveTimeout: RECEIVE_TIME_OUT,
      responseType: ResponseType.json,
    ),
  )..interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  final Dio dio;
}