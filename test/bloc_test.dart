// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc_timer/bloc/timer_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Bloc Timer Test', () {
    blocTest(
      'start count test for replacement bloc implementation',
      build: () => TimerBloc(const Timer()),
      act: (TimerBloc bloc) async {
        bloc.add(TimerStartPressed());
        await Future.delayed(const Duration(seconds: 3));
      },
      expect: () {
        return [TimerCounting(), TimerCounted(time: 1), TimerCounted(time: 2)];
      },
    );

    blocTest(
      'pause count test for bloc implementation replacement',
      build: () => TimerBloc(const Timer()),
      act: (TimerBloc bloc) async {
        bloc.add(TimerStartPressed());
        await Future.delayed(const Duration(seconds: 2));
        bloc.add(TimerPausePressed());
        await Future.delayed(const Duration(seconds: 3));
      },
      expect: () {
        return [TimerCounting(), TimerCounted(time: 1), TimerPaused(time: 2)];
      },
    );

    blocTest(
      'stop count test for bloc implementation replacement',
      build: () => TimerBloc(const Timer()),
      act: (TimerBloc bloc) async {
        bloc.add(TimerStartPressed());
        await Future.delayed(const Duration(seconds: 3));
        bloc.add(TimerStopPressed());
      },
      expect: () => [TimerCounting(), TimerCounted(time: 1), TimerCounted(time: 2), TimerStopped()],
    );

    // blocTest(
    //   'resume count test for bloc implementation replacement',
    //   build: () => TimerBloc(const Timer()),
    //   act: (TimerBloc bloc) async {
    //     bloc.add(TimerStartPressed());
    //     await Future.delayed(const Duration(seconds: 2));
    //     bloc.add(TimerPausePressed());
    //     await Future.delayed(const Duration(seconds: 2));
    //     bloc.add(TimerStartPressed());
    //     await Future.delayed(const Duration(seconds: 1));
    //   },
    //   expect: () => [TimerState(state: TimerStates.counting, time: 3)],
    // );
  });
}
