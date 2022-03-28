import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_timer/bloc/timer_bloc.dart';

class TimerScreen extends StatelessWidget {
  static const String id = '/timerScreen';

  const TimerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Bloc Timer'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 50),
                child: BlocBuilder<TimerBloc, TimerState>(
                  builder: (context, state) {
                    return Text(
                      state.time.toString(),
                      style: const TextStyle(
                        fontSize: 30,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    child: RawMaterialButton(
                      onPressed: () {
                        context.read<TimerBloc>().add(TimerPausePressed());
                      },
                      child: const Icon(
                        Icons.pause,
                        color: Colors.amber,
                        size: 20,
                      ),
                    ),
                  ),
                  Container(
                    width: 70,
                    height: 70,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    child: RawMaterialButton(
                      onPressed: () {
                        context.read<TimerBloc>().add(TimerStartPressed());
                      },
                      child: const Icon(
                        Icons.play_arrow,
                        color: Colors.green,
                        size: 30,
                      ),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    child: RawMaterialButton(
                      onPressed: () {
                        context.read<TimerBloc>().add(TimerStopPressed());
                      },
                      child: const Icon(
                        Icons.stop,
                        color: Colors.red,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
