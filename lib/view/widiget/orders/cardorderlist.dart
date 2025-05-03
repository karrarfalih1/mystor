

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:store313/controller/orders/pending_controller.dart';
import 'package:store313/core/constantk/color.dart';
import 'package:store313/core/constantk/routesname.dart';
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
              
                Text("رقم الطلب : # ${pendtingModel.ordersId}",style:const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
            const Spacer(),
            Text(Jiffy.parse('${pendtingModel.ordersDatetime}').fromNow(),style:TextStyle(color: Colors.grey[650]),),
            const SizedBox(width: 5,)
              ],
            ),
           const Divider(
              height: 20,
            ),
            Text("نوع الطلب :${controller.printtypeorder(pendtingModel.ordersType.toString())}"),
            Text("سعر الطلب : ${pendtingModel.ordersPrice}"),
            Text("سعر التوصيل : ${pendtingModel.ordersPricedelivery} "),
          //  Text("Payment Method : ${controller.printPaymentMethod(pendtingModel.ordersPaymentmethod.toString())}"),
             Text("حالة الطلب : ${controller.printOrderStatus(pendtingModel.ordersStatus.toString())}"),
     const       Divider(height: 20,),
            Row(children: [
              Column(children: [
                 const Text('السعر  الكلي :',style: const TextStyle(fontSize: 14,color: AppColor.maincolor),),
        Text('${pendtingModel.ordersTotalprice}',style: const TextStyle(fontSize: 14,color: AppColor.maincolor),),
      
              ],)
                 ,  const Spacer(),
                 if(pendtingModel.ordersStatus.toString()=="0")
             MaterialButton(
  color: AppColor.maincolorm1,
  onPressed:(){
controller.orderdelet(pendtingModel.ordersId.toString());
  },child:const Text("Delet"),)  
,const SizedBox(width: 5,),
MaterialButton(
  color: AppColor.maincolorm1,
  onPressed:(){
    Get.toNamed(Approute.deltelsorder,arguments: {
      "pendtingModel":pendtingModel
    });

  },child:const Text("Detels"),)      ],)

        ],),
      ),);
  }

}