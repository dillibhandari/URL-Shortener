import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_shorter/api/api_client/dio_http.dart';
import 'package:url_shorter/api/api_client/ihttp.dart';
import 'package:url_shorter/api/api_client/result.dart';
import 'package:flutter/foundation.dart';

typedef ApiCall = Future<Result> Function();

enum HttpVerb { get }

class ApiCallWrapper {
  late IHttp _iHttp;
  ApiCallWrapper._privateConstructor();

  static final ApiCallWrapper _instance = ApiCallWrapper._privateConstructor();

  factory ApiCallWrapper() {
    _instance._iHttp = DioHttp();
    return _instance;
  }

  Future<Result> makeRequest({
    String? url,
    HttpVerb method = HttpVerb.get,
    dynamic data,
  }) async {
    try {
      return await apiCall(url, method);
    } catch (error) {
      if (error is FlutterError) {
        return Result.error(DataError(error.message, 0, null));
      }
      if (error is MissingPluginException) {
        return Result.error(DataError(error.message.toString(), 0, null));
      } else {
        return Result.error(_getErrorData(error));
      }
    }
  }

  Future<Result<dynamic, dynamic>> apiCall(
    String? url,
    HttpVerb method,
  ) async {
    var response = await getResponseFromApi(url: url);
    return Result.success(response.data);
  }

  Future<dynamic> getResponseFromApi(
      {String? url, HttpVerb method = HttpVerb.get}) async {
    dynamic response;
    switch (method) {
      case HttpVerb.get:
        response = await _iHttp.get(url: url);
        break;
    }
    return response;
  }

  DataError _getErrorData(error) {
    String errorDescription = "";
    if (error is DioException) {
      DioException dioError = error;
      errorDescription = dioError.message ?? "";
    } else {
      errorDescription = 'Unexpected error';
    }
    return DataError(errorDescription, error?.response?.statusCode ?? 0,
        error?.response?.data);
  }
}
