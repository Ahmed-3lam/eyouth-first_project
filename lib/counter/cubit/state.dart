abstract class CounterState {}

class InitialCounterState extends CounterState {}

// Create new state for the change happened in UI
class TextChangedState extends CounterState {}
