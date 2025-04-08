import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:store313/controller/orders/pending_controller.dart';
import 'package:store313/controller/notification_controller.dart';
    requestPermissionNotification()async{
      //////////اضافة البيرمشن  من اجل الاشعارات يجب ان تاتي به من الصفح ة الرسمية ل كلاود وساجنك
      NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
  alert: true,
  announcement: false,
  badge: true,
  carPlay: false,
  criticalAlert: false,
  provisional: false,
  sound: true,
);
    }

fcmconfig(){
  FirebaseMessaging.onMessage.listen((message) {
FlutterRingtonePlayer().playNotification();
  
     Get.snackbar(message.notification!.title!, message.notification!.body!);
     refreshPageNotification(message.data);
   NotificationController contnty=Get.put(NotificationController());
   contnty.getdata();
   //contnty.notificationactiv=0;
         
  });
}

refreshPageNotification(data){
  if(Get.currentRoute=="/pending" && data['pagename']=="orders"){
  PendingController controller =Get.find();
  controller.refreshpage();
  }
}

