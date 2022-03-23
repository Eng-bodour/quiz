import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class QuizController extends GetxController with SingleGetTickerProviderMixin {
  late AnimationController _animationController;
  late Animation _animation;
  Animation get animation => _animation;

  @override
  void onInit() {
    _animationController = AnimationController(
      duration: const Duration(minutes: 1),
      vsync: this,
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener(() {
        update();
      });
    _animationController.forward();
    super.onInit();
  }
}
