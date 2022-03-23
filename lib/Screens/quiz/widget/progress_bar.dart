import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz/constant.dart';
import 'package:quiz/controllers/quiztion_controller.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          children: [
            Container(
                width: double.infinity,
                height: 35,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: GetBuilder<QuizController>(
                  init: QuizController(),
                  builder: (controller) {
                    return Stack(
                      children: [
                        LayoutBuilder(
                          builder: (context, constraints) {
                            return Container(
                              width: (constraints.maxWidth *
                                  controller.animation.value),
                              decoration: BoxDecoration(
                                  gradient: kPrimaryGradient,
                                  borderRadius: BorderRadius.circular(50)),
                            );
                          },
                        ),
                        Positioned(
                            child: Padding(
                          padding: const EdgeInsets.only(
                            top: 4,
                            left: 12,
                            right: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  '${(controller.animation.value * 60).round()} sec'),
                              const Icon(Icons.lock_clock),
                            ],
                          ),
                        ))
                      ],
                    );
                  },
                ))
          ],
        ),
      ),
    );
  }
}
