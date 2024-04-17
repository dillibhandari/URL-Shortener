import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:url_shorter/api/api_helper/exception_helper.dart';
import 'package:url_shorter/feature/url_generator/data/model/url_shorter_response_model.dart';
import 'package:url_shorter/feature/url_generator/domain/usecase/url_shorter_usecase.dart';
part 'url_shorter_event.dart';
part 'url_shorter_state.dart';

class UrlShorterBloc extends Bloc<UrlShorterEvent, UrlShorterState> {
  final UrlShorterUseCase _usecase;
  UrlShorterBloc(this._usecase) : super(UrlShorterInitial()) {
    on<UrlShorterEvent>((event, emit) {});
    on<UrlShorterFetch>(_fetchUrlShorter);
  }

  FutureOr<void> _fetchUrlShorter(
      UrlShorterFetch event, Emitter<UrlShorterState> emit) async {
    emit(UrlShorterLoading());
    var response = await _usecase.getResponseFromUrl(event.params);
    response.fold(
      (AppException ex) => emit(
        UrlShorterFailed(ex),
      ),
      (List<UrlShorterResponseModel> modelList) => emit(
        UrlShorterSuccess(modelList[0].shortUrl),
      ),
    );
  }
}
