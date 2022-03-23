import 'dart:async';

import 'package:flutter/material.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({Key? key}) : super(key: key);

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  Duration countdownDuration = Duration(minutes: 10);
  Duration duration = const Duration();
  Timer? timer;
  bool isCountdown = true;

  @override
  void initState() {
    super.initState();
    startTimer();
    reset();
  }

  void reset() {
    if (isCountdown) {
      setState(() {
        duration = countdownDuration;
      });
    } else {
      setState(() {
        duration = const Duration();
      });
    }
  }

  void addTime() {
    setState(() {
      final addSeconds = isCountdown ? -1 : 1;
      final seconds = duration.inSeconds + addSeconds;
      if (seconds < 0) {
        timer?.cancel();
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      addTime();
    });
  }

  @override
  Widget build(BuildContext context) {
    // to 9 --> 09 , 11--> 11
    String towDigits(int n) => n.toString().padLeft(2, '0');
    final seconds = towDigits(duration.inSeconds.remainder(60));
    final minuts = towDigits(duration.inMinutes.remainder(60));
    final hours = towDigits(duration.inHours.remainder(60));

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildTimerCard(time: hours, header: 'Hours'),
          const SizedBox(
            width: 8,
          ),
          buildTimerCard(time: minuts, header: 'Minuts'),
          const SizedBox(
            width: 8,
          ),
          buildTimerCard(time: seconds, header: 'Second'),
        ],
      ),
    );
  }

  Widget buildTimerCard({required String time, required String header}) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              time,
              style: const TextStyle(fontSize: 30, color: Colors.purple),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(header),
        ],
      );
}
