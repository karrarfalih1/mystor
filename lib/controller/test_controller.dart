import 'dart:async';
import 'package:get/get.dart';

class TimerController extends GetxController {
  RxInt remainingTime = 10.obs; // عداد يبدأ من 10
  Timer? timer;

  void startTimer() {
    timer?.cancel(); // إلغاء المؤقت السابق إن وجد
    remainingTime.value = 10; // إعادة تعيين العداد

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingTime.value > 0) {
        remainingTime.value--; // تقليل العداد
      } else {
        timer.cancel(); // إيقاف المؤقت عند انتهاء العداد
      }
    });
  }

  @override
  void onClose() {
    timer?.cancel(); // تنظيف الموارد
    super.onClose();
  }
}
