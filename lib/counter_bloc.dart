import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CounterEvent {}

class IncrementPressed extends CounterEvent {}

class DecrementPressed extends CounterEvent {}

class ResetPressed extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<IncrementPressed>((event, emit) {
      emit(state + 1);
    });
    on<DecrementPressed>((event, emit) {
      if (state > 0) {
        emit(state - 1);
      }
    });
    on<ResetPressed>((event, emit) {
      if (state != 0) {
        emit(0);
      }
    });
  }
}
