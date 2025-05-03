
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/controller/checkout_controller.dart';
import 'package:store313/core/classk/handlingdataview.dart';
import 'package:store313/core/constantk/color.dart';
import 'package:store313/core/constantk/imagesasset.dart';
import 'package:store313/view/widiget/cart/buttomorder.dart';
import 'package:store313/view/widiget/checkout/cardaddresscheckout.dart';
import 'package:store313/view/widiget/checkout/carddeliverytype.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
   CheckoutController controller=  Get.put(CheckoutController());
    return Scaffold(
        bottomNavigationBar: Custombuttomcart(
          title: ' اكمال الشراء',
          onPressedk: () {controller.checkout();},
        ),
        appBar: AppBar(
          title: const Text(" الشراء"),
        ),
        body: GetBuilder<CheckoutController>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.all(20),
                    child: ListView(
                      children: [
                        /*
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
                            controller.choosePaymentMethod("0");
                          },
                          isActive:
                              controller.paymentMethod == "0" ? true : false,
                        ),
                        Cardpaymentmethod(
                          title: "Payment cart",
                          ontap: () {
                            controller.choosePaymentMethod("1");
                          },
                          isActive: controller.paymentMethod == "1"
                              ? true
                              : false,
                        ),*/
                        const SizedBox(
                          height: 10,
                        ),
                      /*  const Text(
                          "اختر طريقة الاستلام",
                          style: TextStyle(
                              color: AppColor.maincolor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),*/
                        const SizedBox(
                          height: 10,
                        ),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Carddeliverytype(
                              title: 'توصيل',
                              isActive: controller.deloveryType=="0"?true:false,
                              lottie: AppImagesasset.layBaik,
                               ontap: () { controller.chosseDeliveryType("0") ;},
                            ),
                            Carddeliverytype(
                              ontap: (){
                                controller.chosseDeliveryType("1");
                              },
                              title: 'استلام',
                           isActive:    controller.deloveryType=="1"?true:false,
                              lottie: AppImagesasset.card,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      // ignore: prefer_const_constructors
                      if(controller.deloveryType=="0")//delevery
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children : [
                           const Text(
                          "اختر موقعك او  انشء واحد جديد ",
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
                        ),),
                        InkWell(
                        onTap: (){
                           controller.goToAddAddress();
                        },
                          child: const SizedBox(
                            height: 65,
                            child: Card(
                              
                              child:Center(child: Text("اضف  موقع جديد",style: TextStyle(color: AppColor.maincolorblue,fontWeight: FontWeight.bold),),),
                          )),
                        )
                      ],)
                      ],
                    ),
                  ),
                )));
  }
}
