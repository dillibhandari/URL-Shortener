import 'package:url_shorter/api/api_client/api_call_wrapper.dart';
import 'package:url_shorter/api/api_client/result.dart';

abstract class UrlShortenerRemoteDataSource {
  Future<Result> fetchResposneFromUrl(String? url);
}

class UrlShortenerRemoteDataSourceImpl extends UrlShortenerRemoteDataSource {
  @override
  Future<Result> fetchResposneFromUrl(String? url) async {
    return await ApiCallWrapper().makeRequest(url: url, method: HttpVerb.get);
  }
}
