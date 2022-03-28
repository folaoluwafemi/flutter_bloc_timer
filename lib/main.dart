import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_timer/bloc/timer_bloc.dart';
import 'package:flutter_bloc_timer/presentation/timer_screen.dart';

void main() {
  runApp(const TimerApp());
}

class TimerApp extends StatelessWidget {
  const TimerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: TimerScreen.id,
      onGenerateRoute: (settings) {
        if (settings.name == TimerScreen.id) {
          return MaterialPageRoute(
            builder: (context) => BlocProvider<TimerBloc>(
              create: (_) => TimerBloc(const Timer()),
              child: const TimerScreen(),
            ),
          );
        } else {
          return MaterialPageRoute(
            builder: (context) => const SafeArea(
              child: Scaffold(
                body: Center(
                  child: Text('You Navigated to the wrong route'),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
