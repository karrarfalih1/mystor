import 'package:flutter/material.dart';
import 'package:store313/core/constantk/color.dart';
import 'package:store313/view/widiget/cart/buttomorder.dart';
import 'package:store313/view/widiget/cart/custombouttomcoupon.dart';

class Custombottomnavigationpar extends StatelessWidget {
  final String totalprice;
  final String price;
  final String discount;
  final TextEditingController textcntroller;
  final void Function()? onPressed;
  const Custombottomnavigationpar(
      {super.key,
      required this.totalprice,
      required this.price,
      required this.discount,
       required this.textcntroller, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            
            child: Row(children: [
            Expanded(
              flex: 2,
              child:  TextFormField(
                controller: textcntroller,
                decoration:const InputDecoration(
                  hintText: "Coupon Code",
                  contentPadding:  EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  border: OutlineInputBorder()
                  ,
                  isDense: true
                ),
              )),
              const SizedBox(width: 10,),
               Expanded(
              
                child:  Custombouttomcoupon(title: "apply",onPressedk: onPressed,))
           
          ],),),
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
                  "Price",
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
                  "discount",
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
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10), child: Divider()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const Text(
                  "Total Price",
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
       const Custombuttomcart(title: 'Place Order'),
        ],
      ),
    );
  }}