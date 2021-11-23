import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlignmentController extends GetxController {
  var alignment = Alignment.topCenter.obs;

  late final AnimationController controller;

  void init(TickerProvider provider) {
    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: provider,
    );
    update();
  }

  void to(Alignment alignment) {
    this.alignment.value = alignment;
  }
}
