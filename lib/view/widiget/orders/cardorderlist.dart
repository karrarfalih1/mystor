

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jiffy/jiffy.dart';
import 'package:store313/controller/home/orders/pending_controller.dart';
import 'package:store313/core/constantk/color.dart';
import 'package:store313/data/model/pendingmodel.dart';

class CardOrderList extends GetView<PendingController>{

   final PendtingModel pendtingModel;
const   CardOrderList({super.key,required this.pendtingModel});

  @override
  Widget build(BuildContext context) {
    return   Card(child: Container(
        padding:const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
              
                Text("Order Number : # ${pendtingModel.ordersId}",style:const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
            const Spacer(),
            Text(Jiffy.parse('${pendtingModel.ordersDatetime}').fromNow(),style:TextStyle(color: Colors.grey[650]),),
            const SizedBox(width: 5,)
              ],
            ),
           const Divider(
              height: 20,
            ),
            Text("Order Type :${controller.printtypeorder(pendtingModel.ordersType.toString())}"),
            Text("Order Price : ${pendtingModel.ordersPrice}"),
            Text("Delivery Price : ${pendtingModel.ordersPricedelivery} "),
            Text("Payment Method : ${controller.printPaymentMethod(pendtingModel.ordersPaymentmethod.toString())}"),
             Text("Order Status : ${controller.printOrderStatus(pendtingModel.ordersStatus.toString())}"),
     const       Divider(height: 20,),
            Row(children: [
              Text('Total Price : ${pendtingModel.ordersTotalprice}',style: const TextStyle(fontSize: 14,color: AppColor.maincolor),),
             const Spacer(),

MaterialButton(
  color: AppColor.maincolorm1,
  onPressed:(){},child:const Text("Detels"),)      ],)

        ],),
      ),);
  }

}