import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/controller/cart_controller.dart';
import 'package:store313/core/classk/handlingdataview.dart';
import 'package:store313/view/widiget/cart/appbarcart.dart';
import 'package:store313/view/widiget/cart/appnubberofflist.dart';
import 'package:store313/view/widiget/cart/custombottomnavigationpar.dart';
import 'package:store313/view/widiget/cart/customordercart.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    return
    
    GetBuilder<CartController>(builder: (controller)=>
    HandlingDataView(statusRequest: controller.statusRequest, widget: 
     Scaffold(
      bottomNavigationBar:  Custombottomnavigationpar(
        totalprice: '2100',
        price: '${controller.totalpriceitems}',
        discount: '10%', textcntroller: controller.coupon!,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children:  [
            const Appbarcart(),
            const SizedBox(
              height: 10,
            ),
            Appnubberofflist(
              title: 'You Have ${controller.totalitems} items in your list',
            ),
            const SizedBox(
            height: 10,
            ),
            ...List.generate(controller.data.length,(index)=>
             Customordercart(
              imagpahth:'${controller.data[index].itemsImage}',
              title: '${controller.data[index].itemsName}',
              price: '${controller.data[index].itemsprice}',
              count: '${controller.data[index].countitems}',
               ondelet: () async{ 
                
              await    controller.delet(controller.data[index].itemsId);
                  controller.refreshpage();
                }, 
               onAdd: () async{ 
              await  controller.add(controller.data[index].itemsId);
                controller.refreshpage();
                },
            ))
          ],
        ),
      ),
    ))
    
    );
  }
}
