import 'package:dartz/dartz.dart';
import 'package:url_shorter/api/api_helper/exception_helper.dart';
import 'package:url_shorter/api/api_helper/response_helper.dart';
import 'package:url_shorter/feature/url_generator/data/model/url_shorter_response_model.dart';
import 'package:url_shorter/feature/url_generator/data/source/remote/url_shorter_remote_data_source.dart';
import 'package:url_shorter/feature/url_generator/domain/repository/url_shorter_repository.dart';

class UrlShorterRepositoryImpl extends UrlShorterRepository {
  final UrlShortenerRemoteDataSource _remoteDataSource;
  UrlShorterRepositoryImpl(this._remoteDataSource);
  @override
  Future<Either<AppException, List<UrlShorterResponseModel>>>
      fetchResposneFromUrl(String? url) async {
    try {
      final response = await _remoteDataSource.fetchResposneFromUrl(url);
      if (response.isSuccess()) {
        List<dynamic> list = response.getValue() as List;

        List<UrlShorterResponseModel> listOfModel =
            list.map((i) => UrlShorterResponseModel.fromJson(i)).toList();
        return Right(listOfModel);
      } else {
        return Left(ResponseHelper.error(response));
      }
    } catch (error) {
      return Left(
          DefaultException(errorMessage: error.toString(), statusCode: 1517));
    }
  }
}
