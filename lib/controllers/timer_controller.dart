import 'dart:async';

import 'package:get/get.dart';

class TimerController extends GetxController {
  static const countdownDuration = const Duration(minutes: 10);
  Duration duration = const Duration();
  Timer? timer;
  bool isCountdown = true;

  String towDigits(int n) => n.toString().padLeft(2, '0');

  @override
  void onInit() {
    // TODO: implement onInit
    startTimer();
    reset();
    super.onInit();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      addTime();
    });
    update();
  }

  void reset() {
    if (isCountdown) {
      duration = countdownDuration;
    } else {
      duration = const Duration();
    }
    update();
  }

  void addTime() {
    final addSeconds = isCountdown ? -1 : 1;
    final seconds = duration.inSeconds + addSeconds;
    if (seconds < 0) {
      timer?.cancel();
    } else {
      duration = Duration(seconds: seconds);
    }
    update();
  }
}
