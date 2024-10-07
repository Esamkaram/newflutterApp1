import 'package:dio/dio.dart';
import 'package:flutter_application_2/core/network/end_ponts.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: EndPonts.baseurl,
        receiveDataWhenStatusError: true,
      ),
    );

    addDioInterceptor();
    return Future.value();
  }

  static Future<Response> getData({
    required String endpont,
    Map<String, dynamic>? query,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? '',
    };

    return await dio.get(
      endpont,
      queryParameters: query,
    );
  }

  static Future<Response> postData({
    required String endpont,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? data,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? '',
    };

    return dio.post(
      endpont,
      data: data,
      queryParameters: query,
    );
  }

  static Future<Response> putData({
    required String endpont,
    Map<String, dynamic>? query,
    required Map<String, dynamic>? data,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'lang': lang,
      'Authorization': token ?? '',
    };

    return dio.put(
      endpont,
      data: data,
      queryParameters: query,
    );
  }

  static void addDioInterceptor() {
    dio.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
        responseBody: true,
      ),
    );
  }
}
