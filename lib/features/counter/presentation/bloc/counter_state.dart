part of 'counter_bloc.dart';

sealed class CounterState extends Equatable {}

final class CounterInitial extends CounterState {
  @override
  List<Object?> get props => [];
}

class CounterResult extends CounterState {
  final int counter;

  CounterResult({required this.counter});

  @override
  List<Object?> get props => [counter];
}
