// ignore_for_file: unnecessary_null_comparison

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_shop_app_dbestech/common/utils/constants.dart';
import 'package:flutter_shop_app_dbestech/global.dart';

class HttpUtil {
  late Dio dio;

  static final HttpUtil _instance = HttpUtil._internal();

  factory HttpUtil() {
    return _instance;
  }

  HttpUtil._internal() {
    BaseOptions option = BaseOptions(
        baseUrl: AppConstants.BASE_URL_For_ALL,
        connectTimeout: const Duration(seconds: 5),
        receiveTimeout: const Duration(seconds: 5),
        headers: {},
        contentType: "application/json : charest=utf-8",
        responseType: ResponseType.json);
    dio = Dio(option);
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        if (kDebugMode) {
          print("new request ${options.data}");
        }
        handler.next(options);
      },
      onResponse: (responce, handler) {
        if (kDebugMode) {
          print("new responce $responce");
        }
        handler.next(responce);
      },
      onError: (DioException e, handler) {
        if (kDebugMode) {
          print("my error is $e");
        }
        ErrorEntity eInfo = createErrorEntity(e);
        onError(eInfo);
      },
    ));
  }

  Map<String, dynamic> getAuthorizationHeader() {
    var headers = <String, dynamic>{};
    var accessToken = Global.storageService.getUserToken();
    //print("user token is $accessToken");
    if (accessToken.isNotEmpty) {
      headers["Authorization"] = 'Bearer $accessToken';
    }
    return headers;
  }

  Future post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }
    var responce = await dio.post(path,
        data: data, queryParameters: queryParameters, options: requestOptions);
    // print("responce.data ${responce.data}");
    return responce.data;
  }
}

class ErrorEntity implements Exception {
  int code = -1;
  String message = '';
  ErrorEntity({required this.code, required this.message});
  @override
  String toString() {
    if (message.isEmpty) {
      return "Exeption";
    }
    return "Exeption code $code,$message";
  }
}

ErrorEntity createErrorEntity(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return ErrorEntity(code: -1, message: "Connection timed out");
    case DioExceptionType.sendTimeout:
      return ErrorEntity(code: -1, message: "send timed out");

    case DioExceptionType.receiveTimeout:
      return ErrorEntity(code: -1, message: "receive timed out");

    case DioExceptionType.badCertificate:
      return ErrorEntity(code: -1, message: "Bad SSl certificates");

    case DioExceptionType.badResponse:
      switch (error.response!.statusCode) {
        case 400:
          return ErrorEntity(code: 400, message: "request syntax error");
        case 401:
          return ErrorEntity(code: 401, message: "Permition denided");
      }
      return ErrorEntity(code: -1, message: "bad Response");

    case DioExceptionType.cancel:
      return ErrorEntity(code: -1, message: "server cancled");

    case DioExceptionType.connectionError:
      return ErrorEntity(code: -1, message: "Connection error");

    case DioExceptionType.unknown:
      return ErrorEntity(code: -1, message: "unknown error");
  }
}

void onError(ErrorEntity eInfo) {
  switch (eInfo.code) {
    case 400:
      break;
    case 401:
      break;
    case 500:
      break;

    default:
      break;
  }
}
