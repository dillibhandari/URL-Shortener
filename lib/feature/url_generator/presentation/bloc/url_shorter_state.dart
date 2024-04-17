part of 'url_shorter_bloc.dart';

sealed class UrlShorterState extends Equatable {
  const UrlShorterState();

  @override
  List<Object> get props => [];
}

final class UrlShorterInitial extends UrlShorterState {}

final class UrlShorterLoading extends UrlShorterState {}

final class UrlShorterSuccess extends UrlShorterState {
  final String shortUrl; 
  const UrlShorterSuccess(this.shortUrl);
}

final class UrlShorterFailed extends UrlShorterState {
  final AppException exception;
  const UrlShorterFailed(this.exception);
}
