import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'package:flutter_bloc_timer/model/timer_model.dart';
part 'timer_state.dart';

abstract class TimerEvent extends Equatable {
  const TimerEvent();
}

class TimerStartPressed extends TimerEvent {
  @override
  List<Object?> get props => [];
}

class TimerPausePressed extends TimerEvent {
  @override
  List<Object?> get props => [];
}


class CountTimer extends TimerEvent{
  int time;
  CountTimer({required this.time});

  @override
  List<Object?> get props => [time];

}

class TimerStopPressed extends TimerEvent {
  @override
  List<Object?> get props => [];
}

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  Timer timer = const Timer();

  StreamSubscription<int>? subscription;

  TimerBloc(this.timer) : super(TimerInitial()) {
    on<TimerStartPressed>(_startTimer);
    on<TimerPausePressed>(_pauseTimer);
    on<TimerStopPressed>(_stopTimer);
    on<CountTimer>(_countTimer);
  }

  dynamic _startTimer(TimerStartPressed event, Emitter emit){
    emit(TimerCounting());
    subscription = timer.count().listen((event) {
      add(CountTimer(time: ++event));

    });
    subscription!.resume();
  }

  dynamic _countTimer(CountTimer event, Emitter emit){
    emit(TimerCounted(time: event.time));
  }


  dynamic _pauseTimer(TimerPausePressed event, Emitter emit) {
    subscription!.pause();
    emit(TimerPaused(time: state.time));
  }

  dynamic _stopTimer(TimerStopPressed event, Emitter emit) {
    subscription!.cancel();
    emit(TimerStopped());
  }

  @override
  Future<void> close() {
    subscription!.cancel();
    return super.close();
  }
}
