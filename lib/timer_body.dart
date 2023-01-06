import 'package:bloc01/Home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerBody extends StatelessWidget {
  const TimerBody({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the TimerCubit from the context
    final TimerCubit timerCubit = context.bloc<TimerCubit>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        BlocBuilder<TimerCubit, TimerState>(
          // Listen for changes in the state and rebuild the UI
          builder: (context, state) {
            final String minutesStr = ((state.duration / 60) % 60)
                .floor()
                .toString()
                .padLeft(2, '0');
            final String secondsStr = (state.duration % 60).toString().padLeft(2, '0');
            return Text('$minutesStr:$secondsStr');
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () {
                // Dispatch a start event to the timer BLoC
                timerCubit.onTimerEvent(TimerEvent.start);
