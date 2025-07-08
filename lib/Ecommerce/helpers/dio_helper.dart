import 'package:dio/dio.dart';

class DioHelper {
  static late Dio _dio;

  static void initialize() {
    _dio = Dio(
      BaseOptions(
          connectTimeout: Duration(seconds: 60),
          receiveTimeout: Duration(seconds: 60),
          baseUrl: 'http://10.0.2.2:3000/',
          receiveDataWhenStatusError: true,
          headers: {
            "Content-Type": "application/json",
          }),
    );
  }

  //Get
  static Future<Response<dynamic>> getData(String path) async {
    final response = await _dio.get(path);
    return response;
  }

  ///Post
  static Future<Response<dynamic>> postData(
    String path, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? params,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: body,
        queryParameters: params,
      );
      return response;
    } catch (e) {
      print(e.toString());
      rethrow;
    }
  }
}
