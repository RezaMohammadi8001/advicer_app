part of 'advicer_bloc.dart';

@immutable
sealed class AdvicerState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class AdvicerInitial extends AdvicerState {}

final class AdvicerStateLoading extends AdvicerState {}

final class AdvicerStateLoaded extends AdvicerState {
  final String advice;
  AdvicerStateLoaded({required this.advice});
  @override
  List<Object?> get props => [advice];
}

final class AdvicerStateError extends AdvicerState {
  final String errorMessage;
  AdvicerStateError({required this.errorMessage});
  @override
  List<Object?> get props => [errorMessage];
}
