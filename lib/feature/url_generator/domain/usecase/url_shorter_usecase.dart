import 'package:dartz/dartz.dart';
import 'package:url_shorter/api/api_helper/exception_helper.dart';
import 'package:url_shorter/feature/url_generator/data/model/url_shorter_response_model.dart';
import 'package:url_shorter/feature/url_generator/domain/repository/url_shorter_repository.dart';

class UrlShorterUseCase {
  final UrlShorterRepository _urlShorterRepository;
  UrlShorterUseCase(this._urlShorterRepository);
  Future<Either<AppException, List<UrlShorterResponseModel>>> getResponseFromUrl(
      UrlShorterParams params) async {
    final url = params.url;
    return await _urlShorterRepository.fetchResposneFromUrl(url);
  }
}

class UrlShorterParams {
  final String url;
  UrlShorterParams({required this.url});
}
