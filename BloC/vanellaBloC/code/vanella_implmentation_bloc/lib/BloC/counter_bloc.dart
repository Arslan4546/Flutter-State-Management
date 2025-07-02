import 'dart:async';

import 'package:vanella_implmentation_bloc/BloC/counter_event.dart';
import 'package:vanella_implmentation_bloc/BloC/counter_state.dart';

class CounterBloc {
  // this is the event stream CounterEvent type
  final _eventStreamController = StreamController<CounterEvent>();
  // this is the state stream CounterState type
  final _stateStreamController = StreamController<CounterState>();
  // this is the getter for the stream of CounterState
  Stream<CounterState> get streamState => _stateStreamController.stream;
  // this i s the getter for the sink of CounterEvent
  StreamSink<CounterEvent> get sinkEvent => _eventStreamController.sink;
  // we get initial state from the CounterState class
  var _state = CounterState(count: 0);
  // this is the Constructor of the CounterBloc class that can listen the events from the _mapEventToState method
  CounterBloc() {
    _eventStreamController.stream.listen(_mapEventToState);
  }
  // This is the methods which update the state based on the event received

  void _mapEventToState(CounterEvent event) {
    if (event is IncrementCounterEvent) {
      _state = CounterState(count: _state.count + 1);
      _stateStreamController.sink.add(_state);
    } else if (event is DecrementCounterEvent) {
      _state = CounterState(count: _state.count - 1);
      _stateStreamController.sink.add(_state);
    } else if (event is ResetCounterEvent) {
      _state = CounterState(count: _state.count * 0);
      _stateStreamController.sink.add(_state);
    }
  }
}
