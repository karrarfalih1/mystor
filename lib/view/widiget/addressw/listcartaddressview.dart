import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/controller/addresscontroller/addressview_controller.dart';
import 'package:store313/data/model/addressviewmodel.dart';

class ListCartAddressView extends GetView<AddressviewController> {
 final Addressviewmodel addressviewmodel; 
const ListCartAddressView({super.key,required this.addressviewmodel });
  @override
  Widget build(BuildContext context) {
    return Container(child: Card(child: Text("{controller.data![index].addressName}"),),);
  }
}