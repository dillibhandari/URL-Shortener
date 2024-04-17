import 'package:url_shorter/api/api_client/ihttp.dart';
import 'package:dio/dio.dart';
import 'logging_interceptior.dart';

class DioHttp implements IHttp {
  late Dio dio;
  DioHttp._privateConstructor();
  static final DioHttp _instance = DioHttp._privateConstructor();
  factory DioHttp() {
    _instance.dio = Dio();
    _instance.dio.options = BaseOptions(
        connectTimeout: const Duration(milliseconds: 15000),
        receiveTimeout: const Duration(milliseconds: 20000));
    _instance.dio.interceptors.add(LoggingInterceptor());
    return _instance;
  }
  @override
  get({String? url, String? token}) async {
    await addUserAgent();
    dio.options.headers['content-Type'] = 'application/json';
    dio.options.headers['apikey'] = '74d5af4c3fa048c1af9389b8a4523e05';
    if (token != null) {
      dio.options.headers["Authorization"] = "Bearer $token";
    }
    return dio.get(url!);
  }

  addUserAgent() async {
    dio.options.headers["user-Agent"] = " okhttp";
  }
}
