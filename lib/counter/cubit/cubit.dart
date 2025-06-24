import 'package:bloc/bloc.dart';

import 'state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(InitialCounterState());

  int counter = 0;

  void increaseCounter() {
    counter++;
    emit(TextChangedState());
    // setState(() {});
  }
}
