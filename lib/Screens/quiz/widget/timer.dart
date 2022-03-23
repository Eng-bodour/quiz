// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:quiz/Screens/quiz/widget/build_timer_card.dart';

// class TimerWidget1 extends StatefulWidget {
//   const TimerWidget1({Key? key}) : super(key: key);

//   @override
//   State<TimerWidget1> createState() => _TimerWidgetState();
// }

// class _TimerWidgetState extends State<TimerWidget1> {
//   // Duration countdownDuration =const Duration(minutes: 10);
//   // Duration duration = const Duration();
//   // Timer? timer;
//   // bool isCountdown = true;

//   // @override
//   // void initState() {
//   //   super.initState();
//   //   startTimer();
//   //   reset();
//   // }

//   // void reset() {
//   //   if (isCountdown) {
//   //     setState(() {
//   //       duration = countdownDuration;
//   //     });
//   //   } else {
//   //     setState(() {
//   //       duration = const Duration();
//   //     });
//   //   }
//   // }

//   // void addTime() {
//   //   setState(() {
//   //     final addSeconds = isCountdown ? -1 : 1;
//   //     final seconds = duration.inSeconds + addSeconds;
//   //     if (seconds < 0) {
//   //       timer?.cancel();
//   //     } else {
//   //       duration = Duration(seconds: seconds);
//   //     }
//   //   });
//   // }

//   // void startTimer() {
//   //   timer = Timer.periodic(const Duration(seconds: 1), (_) {
//   //     addTime();
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     // to 9 --> 09 , 11--> 11
//     //String towDigits(int n) => n.toString().padLeft(2, '0');
//     final seconds = towDigits(duration.inSeconds.remainder(60));
//     final minuts = towDigits(duration.inMinutes.remainder(60));
//     final hours = towDigits(duration.inHours.remainder(60));

//     return Center(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           buildTimerCard(time: hours, header: 'Hours'),
//           const SizedBox(
//             width: 8,
//           ),
//           buildTimerCard(time: minuts, header: 'Minuts'),
//           const SizedBox(
//             width: 8,
//           ),
//           buildTimerCard(time: seconds, header: 'Second'),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/Screens/quiz/widget/build_timer_card.dart';
import 'package:quiz/controllers/timer_controller.dart';

class TimerWidget extends StatelessWidget {
  TimerWidget({Key? key}) : super(key: key);

  // final seconds = towDigits(duration.inSeconds.remainder(60));
  //   final minuts = towDigits(duration.inMinutes.remainder(60));
  //   final hours = towDigits(duration.inHours.remainder(60));

  final controller = Get.put(TimerController());
  //final controller = Get.find<TimerController>();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: GetBuilder<TimerController>(
      init: TimerController(),
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildTimerCard(
              time: controller
                  .towDigits(controller.duration.inHours.remainder(60)),
              header: 'Hours'),
          const SizedBox(
            width: 8,
          ),
          buildTimerCard(
              time: controller
                  .towDigits(controller.duration.inMinutes.remainder(60)),
              header: 'Minuts'),
          const SizedBox(
            width: 8,
          ),
          buildTimerCard(
              time: controller
                  .towDigits(controller.duration.inSeconds.remainder(60)),
              header: 'Second'),
        ],
      ),
    ));
  }
}
