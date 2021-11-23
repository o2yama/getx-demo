import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SliderController extends GetxController {
  late final AnimationController controller;
  late final Animation<Color?> colorTween;
  late final Animation<Color?> alignTween;

  void init(TickerProvider provider) {
    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: provider,
    );
    colorTween = ColorTween(
      begin: Colors.blue,
      end: Colors.red,
    ).animate(controller);
    update();
  }
}
