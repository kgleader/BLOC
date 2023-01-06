import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:bloc01/timer_state.dart';

// Define the events that the timer app can handle
enum TimerEvent { start, pause, reset }

// Define the BLoC (business logic component) for the timer app
class TimerCubit extends Cubit<TimerState> {
  // Declare a timer controller
  Timer _timer;
  int _duration = 0;
  bool _isRunning = false;

  // Initial state is 0 seconds
  TimerCubit() : super(TimerState(0));
  // Listen for events and perform the appropriate action
  void onTimerEvent(TimerEvent event) {
    switch (event) {
      case TimerEvent.start:
        if (!_isRunning) {
          // Start the timer
          _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
            _duration++;
            // Emit a new state with the updated duration
            emit(TimerState(_duration));
          });
          _isRunning = true;
        }
        break;
      case TimerEvent.pause:
        if (_isRunning) {
          // Cancel the timer
          _timer.cancel();
          _isRunning = false;
        }
        break;
      case TimerEvent.reset:
        if (_isRunning) {
          // Cancel the timer
          _timer.cancel();
          _isRunning = false;
        }
        // Reset the duration to 0
        _duration = 0;
        emit(TimerState(_duration));
        break;
    }
  }

  // Clean up the timer when the BLoC is disposed
  @override
  void close() {
    _timer.cancel();
    super.close();
  }
}
