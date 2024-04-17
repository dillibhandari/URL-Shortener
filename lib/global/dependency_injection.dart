import 'package:get_it/get_it.dart';
import 'package:url_shorter/feature/url_generator/data/repository/url_shorter_repository_impl.dart';
import 'package:url_shorter/feature/url_generator/data/source/remote/url_shorter_remote_data_source.dart';
import 'package:url_shorter/feature/url_generator/domain/repository/url_shorter_repository.dart';
import 'package:url_shorter/feature/url_generator/domain/usecase/url_shorter_usecase.dart';
import 'package:url_shorter/feature/url_generator/presentation/bloc/url_shorter_bloc.dart';

GetIt sl = GetIt.instance;

Future<void> initialize() async {
  sl.registerFactory(() => UrlShorterBloc(sl()));

  sl.registerLazySingleton(() => UrlShorterUseCase(sl()));

  sl.registerLazySingleton<UrlShorterRepository>(
      () => UrlShorterRepositoryImpl(sl()));

  sl.registerLazySingleton<UrlShortenerRemoteDataSource>(
      () => UrlShortenerRemoteDataSourceImpl());
}
