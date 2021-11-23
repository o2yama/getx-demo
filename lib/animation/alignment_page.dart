import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/animation/alignment_controller.dart';
import 'package:getx_demo/animation/slider_controller.dart';

class AlignmentPage extends StatefulWidget {
  const AlignmentPage({Key? key}) : super(key: key);

  @override
  _AnimationRectState createState() => _AnimationRectState();
}

class _AnimationRectState extends State<AlignmentPage>
    with TickerProviderStateMixin {
  final ac = Get.put(AlignmentController());

  @override
  void initState() {
    ac.init(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          TextButton(
            onPressed: () => ac.to(Alignment.centerLeft),
            child: const Text(
              'to left',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () => ac.to(Alignment.centerRight),
            child: const Text(
              'to right',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () => ac.to(Alignment.topCenter),
            child: const Text(
              'to top',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () => ac.to(Alignment.bottomCenter),
            child: const Text(
              'to bottom',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ]),
      ),
      body: Obx(
        () => AnimatedContainer(
          duration: const Duration(seconds: 1),
          alignment: ac.alignment.value,
          color: const Color(0xff333333),
          height: MediaQuery.of(context).size.height,
          child: SizedBox(
            height: 100,
            width: 100,
            child: Image.asset('assets/icon3.png'),
          ),
        ),
      ),
    );
  }
}
