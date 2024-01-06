import 'package:advicer_app/domain/usecases/advice_usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'advicer_event.dart';
part 'advicer_state.dart';

class AdvicerBloc extends Bloc<AdvicerEvent, AdvicerState> {
  AdvicerBloc() : super(AdvicerInitial()) {
    final AdviceUseCases adviceUseCases = AdviceUseCases();
    on<AdvicerRequestedEvent>((event, emit) async {
      emit(AdvicerStateLoading());
      // execute business logic
      final advice = await adviceUseCases.getAdvice();
      emit(AdvicerStateLoaded(advice: advice.advice));
      // emit(AdvicerStateError(errorMessage: 'error message'));
    });
  }
}
