part of 'url_shorter_bloc.dart';

sealed class UrlShorterEvent extends Equatable {
  const UrlShorterEvent();

  @override
  List<Object> get props => [];
}

class UrlShorterFetch extends UrlShorterEvent {
  final UrlShorterParams params;

  const UrlShorterFetch(this.params);
}
