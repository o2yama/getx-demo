import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:getx_demo/counter/next_page.dart';

import 'counter_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final cc = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GetX')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                '${cc.count.value}',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            ElevatedButton(
              onPressed: () => Get.to(
                () => NextPage(),
                arguments: {
                  'count': cc.count.value,
                },
              ),
              child: const Text('NextPageへ'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: cc.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
