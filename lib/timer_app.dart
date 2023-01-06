import 'package:bloc01/timer_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Home_page.dart';

class TimerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TimerCubit>(
      create: (context) => TimerCubit(),
      child: TimerBody(),
    );
  }
}
