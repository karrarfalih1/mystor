import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:store313/binding.dart';
import 'package:store313/controller/home/home_controller.dart';
import 'package:store313/controller/home/setting_controller.dart';
import 'package:store313/core/constantk/color.dart';
import 'package:store313/core/constantk/imagesasset.dart';
import 'package:store313/core/constantk/routesname.dart';

class Setting extends StatelessWidget{
  const Setting({Key?key });
  @override
  Widget build(BuildContext context) {
    SettingControllerImp controller=Get.put(SettingControllerImp());
   return Container(
   
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
  onTap: (){},
  title: const Text("Disable Notifications"),
trailing: Switch(value: true, onChanged: (val){}),),

ListTile(
  onTap: (){
    Get.toNamed(Approute.addressview);
  },
  title: const Text("Address"),
trailing: const Icon(Icons.location_on_outlined),),

ListTile(
  onTap: (){
    Get.toNamed(Approute.pending);
  },
  title: const Text("Ordder"),
trailing: const Icon(Icons.card_travel),),
ListTile(
  onTap: (){
    Get.toNamed(Approute.archive);
  },
  title: const Text("Archive"),
trailing: const Icon(Icons.folder_copy_outlined),),
ListTile(
  onTap: (){},
  title: const Text("About Us"),
trailing: const Icon(Icons.help_outline_rounded),),

ListTile(
  onTap: (){},
  title: const Text("Contact Us"),
trailing: const Icon(Icons.phone_callback_outlined),),

ListTile(
  onTap: (){
   
    controller.logout();
  },
  title: const Text("Logout"),
trailing: const Icon(Icons.logout),),
],)
   );
  }


}