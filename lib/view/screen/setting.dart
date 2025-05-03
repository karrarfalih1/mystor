
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/controller/home/setting_controller.dart';
import 'package:store313/core/constantk/color.dart';
import 'package:store313/core/constantk/imagesasset.dart';
import 'package:store313/core/constantk/routesname.dart';
import 'package:url_launcher/url_launcher.dart';
class Setting extends StatelessWidget{

  const Setting({super.key });
  @override
  Widget build(BuildContext context) {
    SettingControllerImp controller=Get.put(SettingControllerImp());
   return SizedBox(
   
child:ListView(children: [
   Stack(
  alignment: Alignment.center,
  clipBehavior: Clip.none,
  children: [
    Container(
      color: AppColor.maincolor,
      height: Get.width/2.2,
    ),
    Positioned(
      
      
      bottom: -40,
      child:Container(
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          
     color: Colors.white,
          borderRadius: BorderRadius.circular(100)
        ),
        child: const CircleAvatar(

          radius: 40,
          backgroundColor: Colors.white,
          backgroundImage: AssetImage(AppImagesasset.profil,),
        ),
      ))
  ],
),
const SizedBox(height: 100,),



ListTile(
  onTap: (){
    Get.toNamed(Approute.addressview);
  },
  title: const Text("المواقع"),
trailing: const Icon(Icons.location_on_outlined),),

ListTile(
  onTap: (){
    Get.toNamed(Approute.pending);
  },
  title: const Text("الطلبات"),
trailing: const Icon(Icons.card_travel),),
ListTile(
  onTap: (){
    Get.toNamed(Approute.archive);
  },
  title: const Text("الارشيف"),
trailing: const Icon(Icons.folder_copy_outlined),),
ListTile(
  onTap: (){},
  title: const Text("حولنا"),
trailing: const Icon(Icons.help_outline_rounded),),

ListTile(
  onTap: (){
    launchUrl(Uri.parse("tel:07817132039"));
  },
  title: const Text("تواصل  مع الدعم"),
trailing: const Icon(Icons.phone_callback_outlined),),

  ListTile(
  onTap: (){
   
    controller.logout();
  },
  title: const Text("تسجيل خروج",style: TextStyle(color: Colors.red),),
trailing: const Icon(Icons.logout),),
],)
   );
  }


}