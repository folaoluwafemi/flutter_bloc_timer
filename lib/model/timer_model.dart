part of 'package:flutter_bloc_timer/bloc/timer_bloc.dart';

class Timer extends Equatable {
  const Timer();

  Stream<int> count() {
    return Stream.periodic(const Duration(seconds: 1), (x) => x).take(60);
  }

  @override
  List<Object?> get props => [count];
}

