import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:store313/controller/home/home_controller.dart';
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
     refreshhomepageorder(message.data);
   NotificationController contnty=Get.put(NotificationController());
 print("0000000000000000-----------------999999999");
 print("${message.data['pagename']}");
   contnty.getdata();
   //contnty.notificationactiv=0;
         
  });
}
refreshhomepageorder(data){
  if(data['pagename'].toString()=='orders'){
     print("0000000000000000--------99999999999---------999999999");
  HomeControllerImp conthome=Get.find();
  
   conthome.refrachorder();
  }
}
refreshPageNotification(data){
  if(Get.currentRoute=="/pending" && data['pagename']=="orders"){
  PendingController controller =Get.find();
  controller.refreshpage();
  }
}

