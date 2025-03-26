import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/controller/addresscontroller/addressview_controller.dart';
import 'package:store313/core/classk/handlingdataview.dart';
import 'package:store313/core/constantk/routesname.dart';

class AddressView extends StatelessWidget {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    AddressviewController controller = Get.put(AddressviewController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Address"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Approute.addressadd);
        },
        child: Icon(Icons.add),
      ),
      body: Container(
        child: GetBuilder<AddressviewController>(
            builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView.builder(
                    itemCount: controller.data!.length,
                    itemBuilder: (context, index) {
                      return Container(
                          //height: 100,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Card(
                            child: ListTile(
                              title: Text(
                                  "${controller.data![index].addressName}"),
                              subtitle: Text(
                                  "${controller.data![index].addressCity}/${controller.data![index].addressStreet}"),
                                  trailing: IconButton(onPressed:(){
                                    controller.deletAddress(controller.data![index].addressId);
                                  }, icon: Icon(Icons.delete_outline,color: Colors.red,)),
                            ),
                          ));
                    }))),
      ),
    );
  }
}
