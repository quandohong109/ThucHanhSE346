import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() {
    if (state == 10) {
      emit(0);
      return;
    }

    emit(state + 1);
  }

  void decrement() {
    if (state == 0) {
      emit(10);
      return;
    }

    emit(state - 1);
  }
}