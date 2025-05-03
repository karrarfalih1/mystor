import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/controller/cart_controller.dart';
import 'package:store313/core/constantk/color.dart';
import 'package:store313/view/widiget/cart/buttomorder.dart';
import 'package:store313/view/widiget/cart/custombouttomcoupon.dart';

class Custombottomnavigationpar extends GetView<CartController> {
  final String totalprice;
  final String price;
  final String discount;
    final String shipping;
  final TextEditingController textcntroller;
  final void Function()? onAddcoupone;
    final void Function()? onpressedOrder;
  const Custombottomnavigationpar(

      {super.key,
      required this.onpressedOrder,
      required this.shipping,
      required this.totalprice,
      required this.price,
      required this.discount,
       required this.textcntroller, this.onAddcoupone});

  @override
  Widget build(BuildContext context) {
    return 
     Column(
        mainAxisSize: MainAxisSize.min,
        children: [
      GetBuilder<CartController>(builder: (controller)=>
      controller.couponname ==null?
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            
            child: Row(children: [
            Expanded(
              flex: 2,
              child:  TextFormField(
                controller: textcntroller,
                decoration:const InputDecoration(
                  hintText: "كود الخصم",
                  contentPadding:  EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  border: OutlineInputBorder()
                  ,
                  isDense: true
                ),
              )),
              const SizedBox(width: 10,),
               Expanded(
              
                child:  Custombouttomcoupon(title: "تفعيل",onPressedk: onAddcoupone,))
           
          ],),):Text("كود الخصم  ${controller.couponname}",style:const TextStyle(color: AppColor.maincolor,fontWeight: FontWeight.bold),),),
     Container(
      margin:const EdgeInsets.all(10),
       padding:const EdgeInsets.all(10),
       decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColor.maincolor)
                ),
      child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const Text(
                  "السعر",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  price,
                  style: const TextStyle(fontSize: 18, fontFamily: "snas"),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const Text(
                  "الخصم",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  discount,
                  style: const TextStyle(fontSize: 18, fontFamily: "snas"),
                ),
              ),
            ],
          ),
                  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const Text(
                  "التوصيل",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  shipping,
                  style: const TextStyle(fontSize: 18, fontFamily: "snas"),
                ),
              ),
            ],
          ),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10), child: Divider()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const Text(
                  "السعر الكلي",
                  style: TextStyle(
                      fontSize: 18,
                      color: AppColor.maincolor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
               
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  totalprice,
                  style: const TextStyle(
                      fontSize: 18,
                      fontFamily: "snas",
                      color: AppColor.maincolor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        
      ],),
     ),
        Custombuttomcart(title: 'تاكيد الطلب',onPressedk:onpressedOrder,),
        ],
      )
    ;
    }
}