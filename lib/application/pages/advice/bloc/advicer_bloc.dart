import 'package:advicer_app/domain/failures/failures.dart';
import 'package:advicer_app/domain/usecases/advice_usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'advicer_event.dart';
part 'advicer_state.dart';

const generalFailureMessage = 'Ups, something gone wrong. Please try again!';
const serverFailureMessage = 'Ups, API Error. please try again!';
const cacheFailureMessage = 'Ups, chache failed. Please try again!';

class AdvicerBloc extends Bloc<AdvicerEvent, AdvicerState> {
  final AdviceUseCases adviceUseCases;
  AdvicerBloc({required this.adviceUseCases}) : super(AdvicerInitial()) {
    on<AdvicerRequestedEvent>((event, emit) async {
      emit(AdvicerStateLoading());
      // execute business logic
      final failureOrAdvice = await adviceUseCases.getAdvice();
      failureOrAdvice.fold(
        (failure) => emit(
          AdvicerStateError(
            errorMessage: _mapFailureToMessage(failure),
          ),
        ),
        (advice) => emit(AdvicerStateLoaded(advice: advice.advice)),
      );
    });
  }
  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      case CacheFailure:
        return cacheFailureMessage;
      default:
        return generalFailureMessage;
    }
  }
}
