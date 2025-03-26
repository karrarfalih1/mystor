import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:store313/controller/addresscontroller/addaddress_controller.dart';
import 'package:store313/controller/addresscontroller/addmap_controller.dart';
import 'package:store313/core/classk/handlingdataview.dart';
import 'package:store313/core/functionsk/validinput.dart';
import 'package:store313/view/widiget/auth/costomtestfeld.dart';
import 'package:store313/view/widiget/auth/custombuttomauth.dart';

class AddressAdd extends StatelessWidget{
  const AddressAdd({super.key});

  @override
  Widget build(BuildContext context) {
AddmapController controllerpage= Get.put(AddmapController());
AddaddressController controlleradd =Get.put(AddaddressController());
  return Scaffold(
  bottomNavigationBar: Container(
    padding: const EdgeInsets.all(10),
    child: CustomButtomAuth(textbuttom: "اضافة موقعك ", onPressed: (){
      controlleradd.addmylocation(controllerpage.lat!,controllerpage.long!);
    })),
appBar: AppBar(title: const Text("اضافة موقع"),),
body: SizedBox(child:

GetBuilder<AddaddressController>(builder: (controlleradd){
  return HandlingDataView(statusRequest: controlleradd.statusRequest, widget: 
GetBuilder<AddmapController>(builder: (controllerpage){
  return HandlingDataView(statusRequest: controllerpage.statusRequest, widget: 
   Column(children: [
  Expanded(child: 
  controllerpage.kGooglePlex !=null?
   ClipRRect(
    borderRadius:const BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
     child: GoogleMap(
      markers: controllerpage.markers.toSet(),
     onTap: (latlong){
       controllerpage.addmarker(latlong);
     },
          mapType: MapType.normal,
          initialCameraPosition:controllerpage.kGooglePlex!,
          onMapCreated: (GoogleMapController controllermap) {
          
           controllerpage.completercontroller.complete(controllermap);
          },
        ),
   ):const Text("")
      ,),
      Expanded(
flex: 1,
        child:Form(
          key: controlleradd.formstateaddress,
          child: Container(
            padding: const EdgeInsets.all(15),
            child: ListView(children: [
              Customtextfeld(hintText: "اضف اسم للموقع", labeltext: "الاسم", iconss: Icons.abc, mycontroller: controlleradd.name, 
                 valid: (val){
                return validInput(val!, 1, 20, "name");
                  },),
                    Customtextfeld(hintText: "مثل بغداد", labeltext: "المدينة", iconss: Icons.location_city_outlined, mycontroller: controlleradd.city, 
                 valid: (val){
                return validInput(val!, 1, 20, "name");
                  },),
                    Customtextfeld(hintText: "الشارع واقرب نقطة دالة ", labeltext: "الشارع", iconss: Icons.edit_location_alt_outlined, mycontroller: controlleradd.street, 
                 valid: (val){
                return validInput(val!, 1, 20, "name");
                  },)
            ],),
          ),
        ))
 ],));
  }));}),),
  );
  }

}