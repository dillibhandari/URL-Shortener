import 'package:dartz/dartz.dart';
import 'package:url_shorter/api/api_helper/exception_helper.dart';
import '../../data/model/url_shorter_response_model.dart';

abstract class UrlShorterRepository {
  Future<Either<AppException, List<UrlShorterResponseModel>>> fetchResposneFromUrl(
      String? url);
}
