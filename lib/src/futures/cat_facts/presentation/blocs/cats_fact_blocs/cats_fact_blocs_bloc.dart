import 'dart:async';

import 'package:alex_k_test_cats_facts/src/core/usecases/usecase.dart';
import 'package:bloc/bloc.dart';

import '../../../../../config/constaints/error_messages.dart';
import '../../../../../config/constaints/ui_constaints.dart';
import '../../../../../core/error/failuers.dart';
import '../../../domain/usecase/get_cat_facts_history_usecase.dart';
import '../../../domain/usecase/get_cat_facts_use_case.dart';
import 'cats_fact_blocs_event.dart';
import 'cats_fact_blocs_state.dart';

class CatsFactBlocs extends Bloc<CatsFactBlocsEvent, CatsFactState> {
  final GetCatFactsUseCase getCatFactsUseCase;
  final GetCatFactsHistoryUseCase getCatFactsHistoryUseCase;

  CatsFactBlocs(
      {required this.getCatFactsUseCase,
      required this.getCatFactsHistoryUseCase})
      : super(CatsFactState()) {
    on<LoadCatFactEvent>(_loadCatRandomFact);
    on<LoadCatFactsHistory>(_loadCatFactsHistory);
  }

  get loadRandomCatFact => add(LoadCatFactEvent());

  get loadRandomCatFactHistory => add(LoadCatFactsHistory());


  FutureOr<void> _loadCatRandomFact(
      LoadCatFactEvent event, Emitter<CatsFactState> emit) async {
    emit(state.clone(didFactLoading: true, imageUrl: ""));
    var res = await getCatFactsUseCase(NoParams());
    res.fold((left) {
      //error
      emit(state.clone(
          didFactLoading: false, error: _mapFailureToMessage(left), imageUrl: ""));
    }, (right) {
      //successful
      emit(state.clone(
          didFactLoading: false,
          catFactEntity: right,
          error: "",
          imageUrl: "https://cataas.com/cat"));
    });
  }

  FutureOr<void> _loadCatFactsHistory(
      LoadCatFactsHistory event, Emitter<CatsFactState> emit) async {
    emit(state.clone(didFactLoading: true, imageUrl: ""));
    var res = await getCatFactsHistoryUseCase(NoParams());
    res.fold((left) {
      emit(state.clone(
          didFactLoading: false, error: _mapFailureToMessage(left), imageUrl: ""));
    }, (right) {
      emit(state.clone(catsHistoryList: right, didFactLoading: false));
    });

  }

  String _mapFailureToMessage(Failures failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}
