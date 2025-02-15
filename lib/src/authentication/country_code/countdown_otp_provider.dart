import 'dart:async';
import 'package:get/get.dart';

class OTPController extends GetxController {
  int get index => _index.value;
  final _index = 60.obs;
  final countdownTimer = Timer(const Duration(), () {}).obs;

  changeIndex({int index = 60}) async {
    var counter = index;
    countdownTimer.value = Timer.periodic(const Duration(seconds: 1), (timer) {
      counter--;
      _index.value = counter;
      if (counter == 0) {
        _stopTimer();
      }
    });
  }

  void _stopTimer() {
    countdownTimer.value.cancel();
  }

  @override
  void onInit() {
    changeIndex();
    super.onInit();
  }
}
