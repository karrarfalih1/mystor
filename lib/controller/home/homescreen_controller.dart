import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/core/constantk/routesname.dart';
import 'package:store313/view/screen/home/favorite.dart';
import 'package:store313/view/screen/home/home.dart';
import 'package:store313/view/screen/setting.dart';

abstract class HomeScreenController extends GetxController{
changePage(int curentpag);

 gotocart();
}
class HomeScreenControllerImp extends HomeScreenController{
int curentpage=0;

List<IconData> infoBootumAppBar=[
Icons.home_outlined,
Icons.favorite_outline,
Icons.person_outline,
Icons.settings_outlined

];
  List<Widget> listwidget=[
const Homepage(),
const Favorite(),

const Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
Center(child: Text("pagethree"),)
],),

Setting()
  ];
  @override
  changePage(int i) {
    curentpage=i;
    print("----------------iiiiiiiiiiiiiiiiiii");
    print(i);
    update();
   
  }

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  gotocart(){
    Get.toNamed(Approute.cart);
  }


}