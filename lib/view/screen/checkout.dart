
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/controller/checkout_controller.dart';
import 'package:store313/core/classk/handlingdataview.dart';
import 'package:store313/core/constantk/color.dart';
import 'package:store313/core/constantk/imagesasset.dart';
import 'package:store313/view/widiget/cart/buttomorder.dart';
import 'package:store313/view/widiget/checkout/cardaddresscheckout.dart';
import 'package:store313/view/widiget/checkout/carddeliverytype.dart';
import 'package:store313/view/widiget/checkout/cardpaymentmethod.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CheckoutController());
    return Scaffold(
        bottomNavigationBar: Custombuttomcart(
          title: ' Checkout',
          onPressedk: () {},
        ),
        appBar: AppBar(
          title: const Text(" Checkout"),
        ),
        body: GetBuilder<CheckoutController>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.all(20),
                    child: ListView(
                      children: [
                        const Text(
                          "Choose Payment Method",
                          style:  TextStyle(
                              color: AppColor.maincolor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        Cardpaymentmethod(
                          title: 'Cach',
                          ontap: () {
                            controller.choosePaymentMethod("cach");
                          },
                          isActive:
                              controller.paymentMethod == "cach" ? true : false,
                        ),
                        Cardpaymentmethod(
                          title: "Payment cart",
                          ontap: () {
                            controller.choosePaymentMethod("payment");
                          },
                          isActive: controller.paymentMethod == "payment"
                              ? true
                              : false,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Choose Delivery Type",
                          style: TextStyle(
                              color: AppColor.maincolor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Carddeliverytype(
                              title: 'Delvery',
                              isActive: controller.deloveryType=="delvery"?true:false,
                              image: AppImagesasset.OnBoardingImageTwo,
                               ontap: () { controller.chosseDeliveryType("delvery") ;},
                            ),
                            Carddeliverytype(
                              ontap: (){
                                controller.chosseDeliveryType("recive");
                              },
                              title: 'Recive',
                           isActive:    controller.deloveryType=="recive"?true:false,
                              image: AppImagesasset.OnBoardingImageThree,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      // ignore: prefer_const_constructors
                      if(controller.deloveryType=="delvery")
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children : [
                           const Text(
                          "Shipping Address",
                          style: TextStyle(
                              color: AppColor.maincolor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                         const SizedBox(
                          height: 10,
                        ),
                        ...List.generate(controller.dataaddress.length,
                        (index)=>
                         Cardaddresscheckout(
                          ontap: (){
                            controller.chossShippingAddress("${controller.dataaddress[index].addressId}");
                          },
                          title: '${controller.dataaddress[index].addressName}',
                          isActive:controller.addressid== "${controller.dataaddress[index].addressId}"?true:false,
                          subtitle: '${controller.dataaddress[index].addressCity} / ${controller.dataaddress[index].addressStreet}',
                        ),)
                        
                      ],)
                      ],
                    ),
                  ),
                )));
  }
}
