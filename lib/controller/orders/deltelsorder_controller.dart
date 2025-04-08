
import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:store313/core/classk/statusRequest.dart';
import 'package:store313/core/functionsk/handlingdatacontroller.dart';
import 'package:store313/data/datasource/remote/orders/orderdetels_data.dart';
import 'package:store313/data/model/detelsordersmodel.dart';
import 'package:store313/data/model/pendingmodel.dart';

class DeltelsorderController extends GetxController{
late PendtingModel deltelslist;

   StatusRequest statusRequest = StatusRequest.none;
 OrderdetelsData  orderdetelsDat = OrderdetelsData(Get.find());
  double? lat;
  double?long;
  List<DetelsModel> data=[];
  List<Marker> markers = [];
  final Completer<GoogleMapController> completercontroller =
      Completer<GoogleMapController>();

  CameraPosition? kGooglePlex;
  addmarker() {
    markers.clear();
    markers.add(Marker(markerId: const MarkerId("1"), position: LatLng(lat!, long!)));
 
    kGooglePlex = CameraPosition(
        target:LatLng(lat!, long!), zoom: 13.222);
        
  }
  inialData(){
    if(deltelslist.ordersType==0){
    lat= double.parse(deltelslist.addressLat.toString());
    long= double.parse(deltelslist.addressLong.toString());
      
      addmarker();
  }
    }
    


  @override
  void onInit() {
   
   
    deltelslist=Get.arguments['pendtingModel'];
 inialData();
        getdeteles();
    super.onInit();
  }






    getdeteles() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await orderdetelsDat.getData(deltelslist.ordersId.toString());
    statusRequest = handleingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        if (response['status'] == 'success') {
          List dataresponse = response['data'];
          data.addAll(dataresponse.map((e) => DetelsModel.fromJson(e)));
        }
        
      } else {
        statusRequest = StatusRequest.failure;
      }
    }

    update();
  }
  

}