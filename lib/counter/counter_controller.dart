import 'package:get/get.dart';

class CounterController extends GetxController {
  var count = 0.obs;
  increment() => count++;
  resetCount() => count.value = 0;
}
