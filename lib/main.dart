import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/animation/alignment_page.dart';
import 'package:getx_demo/animation/slider_page.dart';
import 'package:getx_demo/counter/counter_controller.dart';

import 'counter/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SliderPage(),
    );
  }
}
