import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import 'counter_controller.dart';

class NextPage extends StatelessWidget {
  NextPage({Key? key}) : super(key: key);
  final CounterController cc = Get.find();
  final arguments = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX'),
        leading: Container(),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${arguments['count']}',
                style: Theme.of(context).textTheme.headline3,
              ),
              ElevatedButton(
                onPressed: () => Get.snackbar(
                  "タイトル",
                  "詳細の内容",
                  snackPosition: SnackPosition.BOTTOM,
                  duration: const Duration(seconds: 2),
                ),
                child: const Text('Snackbar'),
              ),
              ElevatedButton(
                onPressed: () => Get.defaultDialog(
                    title: "タイトル",
                    middleText: "詳細の内容",
                    textCancel: "キャンセル",
                    textConfirm: 'OK',
                    barrierDismissible: false,
                    onConfirm: () {
                      Get.back();
                      Get.snackbar(
                        "ダイアログでOK",
                        "",
                        snackPosition: SnackPosition.BOTTOM,
                        duration: const Duration(seconds: 2),
                      );
                    }),
                child: const Text('Dialog'),
              ),
              ElevatedButton(
                onPressed: () => Get.bottomSheet(
                  Container(
                    height: 200,
                    color: Colors.white,
                    child: const Center(child: Text("内容")),
                  ),
                ),
                child: const Text('BottomSheet'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          cc.resetCount();
          Get.back();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
