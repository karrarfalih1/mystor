import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:store313/core/classk/statusRequest.dart';

class AddmapController extends GetxController {


  StatusRequest statusRequest = StatusRequest.loading;
  Position? position;
  String? lat;
  String?long;
  List<Marker> markers = [];
  final Completer<GoogleMapController> completercontroller =
      Completer<GoogleMapController>();

  CameraPosition? kGooglePlex;
  addmarker(LatLng latlang) {
    markers.clear();
    markers.add(Marker(markerId: const MarkerId("1"), position: latlang));
    update();
  }

  getCurrentpostion() async {
    position = await Geolocator.getCurrentPosition();
lat=position!.latitude.toString();
long=position!.longitude.toString();
    markers.add(Marker(
      markerId:const MarkerId("1"),
      position: LatLng(position!.latitude, position!.longitude),
    ));
    kGooglePlex = CameraPosition(
        target: LatLng(position!.latitude, position!.longitude), zoom: 13.222);
        
    statusRequest = StatusRequest.success;
    update();
  }

  @override
  void onInit() {

    getCurrentpostion();

    super.onInit();
  }
}
