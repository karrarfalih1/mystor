import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/controller/home/home_controller.dart';
import 'package:store313/core/classk/statusRequest.dart';
import 'package:store313/core/constantk/routesname.dart';
import 'package:store313/core/functionsk/handlingdatacontroller.dart';
import 'package:store313/core/servicesk/services.dart';
import 'package:store313/data/datasource/remote/address_data.dart';

class AddaddressController extends GetxController {
  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.find();
  GlobalKey<FormState> formstateaddress = GlobalKey<FormState>();
  TextEditingController? street;
  TextEditingController? name;
  TextEditingController? city;
  String? mylat;
  String? mylong;

  StatusRequest statusRequest = StatusRequest.none;

  addmylocation(String lat, String long) {
    if (formstateaddress.currentState!.validate()) {
      AddAddress(lat, long);
      
    }
  }

  AddAddress(String lat, String long) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.addAddress(
        myservices.sharedPreferences.getString("id"),
        name!.text,
        street!.text,
        city!.text,
        lat.toString(),
        long.toString());
    statusRequest = handleingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Get.offAllNamed(Approute.homepage);
        Get.snackbar("نجاح", "تمت اضافة الموقع بنجاح");
      } else {
        statusRequest = StatusRequest.failure;
        Get.snackbar("فشل", "لم يتم اضافة موقعك");
      }
    }
    update();
  }

  @override
  void onInit() {
    street = TextEditingController();
    city = TextEditingController();
    name = TextEditingController();

    super.onInit();
  }
}
