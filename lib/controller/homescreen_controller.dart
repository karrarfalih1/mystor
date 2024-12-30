import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/view/screen/favorite.dart';
import 'package:store313/view/screen/home.dart';

abstract class HomeScreenController extends GetxController{
changePage(int curentpag);


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

const Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
Center(child: Text("pagefore"),)
],),
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


}