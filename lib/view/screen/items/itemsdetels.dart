
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/controller/itemsdetels_controller.dart';
import 'package:store313/core/classk/handlingdataview.dart';
import 'package:store313/core/constantk/color.dart';
import 'package:store313/view/widiget/itemsdetels/imageitemscustom.dart';
import 'package:store313/view/widiget/itemsdetels/pricecostom.dart';
class ItemsDetels extends StatelessWidget {
  const ItemsDetels({super.key});
  @override
  Widget build(BuildContext context) {
    ItemsdetelsControllerImp controller = Get.put(ItemsdetelsControllerImp());

    return Scaffold(
          bottomNavigationBar: Container(
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColor.maincolor),
          margin:const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: MaterialButton(
          onPressed: () {
            controller.gotocart();
          },
          child:const Text(
          "Go to Card",
          style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body:GetBuilder<ItemsdetelsControllerImp>(builder: (controller)=>HandlingDataView(statusRequest: controller.statusRequest, widget:  Container(
            child: ListView(
          children: [
            Imageitemscustom(),
            const SizedBox(
              height: 85,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${controller.itemsModel.itemsName}",
                    style:const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColor.maincolorblue),
                  ),
                  Pricecostom(
                    onpressedplus: () {
                  
                      controller.add();
                    },
                    onpressedmains: () {
                     
                       controller.remove();
                    },
                    price: '${controller.itemsModel.itemsPrice}',
                    count: '${controller.countitems}',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${controller.itemsModel.itemsDesc}${controller.itemsModel.itemsDesc}${controller.itemsModel.itemsDesc}${controller.itemsModel.itemsDesc}",
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text("Color",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: AppColor.maincolorblue)),
                  const SizedBox(
                    height: 10,
                  ),
               //   Subitemsdetels()
                ],
              ),
            )
          ],
        )))));
  }
}
