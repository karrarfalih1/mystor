import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:store313/controller/orders/deltelsorder_controller.dart';
import 'package:store313/core/classk/handlingdataview.dart';
import 'package:store313/core/constantk/color.dart';

class Deltelsorder extends StatelessWidget {
  const Deltelsorder({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DeltelsorderController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Deltels orders"),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GetBuilder<DeltelsorderController>(builder: (controller) {
            return HandlingDataView(statusRequest: controller.statusRequest, widget: 
            ListView(
              children: [
                Card(
                  child: Container( 
                    margin:const EdgeInsets.all(10),
                    padding:const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Table(
                          children:  [
                         const   TableRow(children: [
                              Text(
                                "Items ",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: AppColor.maincolor,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "QTY ",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: AppColor.maincolor,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "price ",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: AppColor.maincolor,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ]),
                      ...List.generate(controller.data.length, (index)=>
                         TableRow(children: [
                              Text(
                                "${controller.data[index].itemsName} ",style: TextStyle(fontSize: 14),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                  "${controller.data[index].countitems} ",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                   "${controller.data[index].itemsprice} ",
                                textAlign: TextAlign.center,
                              ),
                            ]),
                      )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                         SizedBox(
                          child: Text(
                            "price:${controller.deltelslist.ordersTotalprice}\$ ",
                            style:const TextStyle(
                                fontSize: 15,
                                color: AppColor.maincolor,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                if(controller.deltelslist.ordersType==0)
                
  Card(
                  child: ListTile(
                    title: Text("${controller.deltelslist.addressName}"),
                    subtitle: Text(
                        "${controller.deltelslist.addressCity}/${controller.deltelslist.addressStreet}"),
                  ),
                ),
                
              
   
            if(controller.deltelslist.ordersType==0)    Card(
                child: Container(
                
                      height: 300,
                      width: double.infinity,
                      child: controller.kGooglePlex != null
                          ? ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              child: GoogleMap(
                                markers: controller.markers.toSet(),
                                mapType: MapType.normal,
                                initialCameraPosition: controller.kGooglePlex!,
                                onMapCreated: (GoogleMapController controllermap) {
                                  controller.completercontroller
                                      .complete(controllermap);
                                },
                              ),
                            )
                          : const Text(""),
                    ),
              ),
          
              ],
            ));
          })),
    );
  }
}
