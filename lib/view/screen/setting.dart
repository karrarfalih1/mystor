import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:store313/binding.dart';
import 'package:store313/controller/home/setting_controller.dart';
import 'package:store313/core/constantk/color.dart';
import 'package:store313/core/constantk/imagesasset.dart';

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
        padding: EdgeInsets.all(7),
        decoration: BoxDecoration(
          
     color: Colors.white,
          borderRadius: BorderRadius.circular(100)
        ),
        child: CircleAvatar(

          radius: 40,
          backgroundColor: Colors.white,
          backgroundImage: AssetImage(AppImagesasset.profil,),
        ),
      ))
  ],
),
SizedBox(height: 100,),

ListTile(
  onTap: (){},
  title: Text("Disable Notifications"),
trailing: Icon(Icons.notifications_outlined),),

ListTile(
  onTap: (){},
  title: Text("Address"),
trailing: Icon(Icons.location_on_outlined),),

ListTile(
  onTap: (){},
  title: Text("About Us"),
trailing: Icon(Icons.help_outline_rounded),),

ListTile(
  onTap: (){},
  title: Text("Contact Us"),
trailing: Icon(Icons.phone_callback_outlined),),

ListTile(
  onTap: (){
    controller.logout();
  },
  title: Text("Logout"),
trailing: Icon(Icons.logout),),
],)
   );
  }


}