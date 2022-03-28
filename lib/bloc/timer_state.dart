part of 'package:flutter_bloc_timer/bloc/timer_bloc.dart';

abstract class TimerState extends Equatable {
  int time;

  TimerState({
    this.time = 0,
  });

  @override
  List<Object?> get props => [time];
}

class TimerInitial extends TimerState {
  TimerInitial() : super();

  @override
  List<Object?> get props => [time];
}

class TimerCounted extends TimerState {
  TimerCounted({
    required int time,
  }) : super(time: time);

  @override
  List<Object?> get props => [time];
}

class TimerCompleted extends TimerState {
  TimerCompleted({required int time}) : super(time: time);

  @override
  List<Object?> get props => [time];
}

class TimerCounting extends TimerState {
  TimerCounting() : super();

  @override
  List<Object?> get props => [time];
}

class TimerPaused extends TimerState {
  TimerPaused({
    required int time,
  }) : super(time: time);

  @override
  List<Object?> get props => [time];
}

class TimerStopped extends TimerState {
  TimerStopped() : super(time: 0);

  @override
  List<Object?> get props => [time];
}
