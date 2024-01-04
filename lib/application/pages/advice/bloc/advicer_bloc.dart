import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'advicer_event.dart';
part 'advicer_state.dart';

class AdvicerBloc extends Bloc<AdvicerEvent, AdvicerState> {
  AdvicerBloc() : super(AdvicerInitial()) {
    on<AdvicerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
