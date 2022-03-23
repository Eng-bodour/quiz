import 'package:flutter/material.dart';
import 'package:quiz/Screens/quiz/widget/progress_bar.dart';
import 'package:quiz/Screens/quiz/widget/timer.dart';

import 'package:quiz/constant.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        ProgressBar(),
        const SizedBox(
          height: 50,
        ),
        TimerWidget(),
        // Text.rich(
        //   TextSpan(
        //       text: 'Quistion 1',
        //       style: TextStyle(
        //         color: Colors.black,
        //       ),
        //       children: [
        //         TextSpan(
        //           text: '/10',
        //           style: ,
        //         )
        //       ]),
        // ),
      ],
    );
  }
}
