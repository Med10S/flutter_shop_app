import 'package:dio/dio.dart';

class HttpUtil {
  late Dio dio;

  static final HttpUtil _instance = HttpUtil._internal();

  factory HttpUtil() {
    return _instance;
  }
  HttpUtil._internal() {
    BaseOptions option = BaseOptions(
        baseUrl: "http://127.0.0.1:8000",
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
        headers: {},
        contentType: "application/json : charest=utf-8",
        responseType: ResponseType.json);
    dio = Dio(option);
  }
  Map<String, dynamic> getAuthorizationHeader() {
    var headers = <String, dynamic>{};
    return headers;
  }
}
