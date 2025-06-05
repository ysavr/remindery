import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';

part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int _counter = 0;

  CounterBloc() : super(CounterInitial()) {
    on<CounterIncrementEvent>(_onIncrement);
    on<CounterDecrementEvent>(_onDecrement);
  }

  void _onIncrement(CounterIncrementEvent event, Emitter<CounterState> emit) {
    _counter += 1;
    emit(CounterResult(counter: _counter + 1));
  }

  void _onDecrement(CounterDecrementEvent event, Emitter<CounterState> emit) {
    _counter -= 1;
    emit(CounterResult(counter: _counter - 1));
  }
}
