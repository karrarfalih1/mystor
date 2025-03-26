
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/controller/home/home_controller.dart';
import 'package:store313/core/classk/statusRequest.dart';
import 'package:store313/core/functionsk/handlingdatacontroller.dart';
import 'package:store313/core/servicesk/services.dart';
import 'package:store313/data/datasource/remote/address_data.dart';
import 'package:store313/data/model/addressviewmodel.dart';

class AddressviewController extends GetxController {
  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;
List<Addressviewmodel>? data=[];

deletAddress(addressid){
  data!.removeWhere((element) =>element.addressId==addressid ,);
  addressData.addressdelet("$addressid");
  update();
}

  AddressView() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.addressview(
        myservices.sharedPreferences.getString("id"),);
      
   
    statusRequest = handleingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
       List responsedata=response['data'];
       data?.addAll(responsedata.map((e)=>Addressviewmodel.fromJson(e),));
      } else {
      }
    }
    update();
  }

  @override
  void onInit() {
   AddressView();
    super.onInit();
  }
}
