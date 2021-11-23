import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:getx_demo/animation/slider_controller.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({Key? key}) : super(key: key);

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> with TickerProviderStateMixin {
  final sc = Get.put(SliderController());

  @override
  void initState() {
    sc.init(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Slider')),
      body: GetBuilder<SliderController>(
        init: SliderController(),
        builder: (controller) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedBuilder(
                animation: sc.controller,
                builder: (context, _) {
                  return Slider(
                    value: sc.controller.value,
                    onChanged: (value) => sc.controller.value = value,
                  );
                },
              ),
              const SizedBox(height: 32),
              AnimatedBuilder(
                animation: sc.controller,
                builder: (context, _) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      sc.controller.value.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 32),
              AnimatedBuilder(
                animation: sc.colorTween,
                builder: (context, _) {
                  final leftOffset =
                      sc.controller.value * MediaQuery.of(context).size.width -
                          100;
                  return Padding(
                    padding: EdgeInsets.only(left: leftOffset),
                    child: Container(
                      color: sc.colorTween.value,
                      height: 100,
                      width: 100,
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
