sealed class CounterEvent {
  const CounterEvent();
}

class IncrementCounterEvent extends CounterEvent {
  const IncrementCounterEvent();
}

class DecrementCounterEvent extends CounterEvent {
  const DecrementCounterEvent();
}

class ResetCounterEvent extends CounterEvent {
  const ResetCounterEvent();
}
