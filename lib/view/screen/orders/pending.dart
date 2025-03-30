import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/controller/home/orders/pending_controller.dart';
import 'package:store313/core/classk/handlingdataview.dart';
import 'package:store313/core/constantk/color.dart';
import 'package:store313/data/model/pendingmodel.dart';

class Pending extends StatelessWidget{
  const Pending({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PendingController());
   return Scaffold(

    appBar:AppBar(title:const Text("Orders"),) ,
    body: Container(
      padding:const EdgeInsets.all(15),
      child:GetBuilder<PendingController>(builder: (controller)=>
     HandlingDataView(statusRequest: controller.statusRequest, widget:  ListView.builder(
        itemCount: controller.data.length,
        itemBuilder: (context,index){
        return CardOrderList(pendtingModel: controller.data[index]);
      }))
     )
    ),
   );
  }

}


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
            Text("Order Number : # ${pendtingModel.ordersId}",style:const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
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
              Text('Total Price : ${pendtingModel.ordersTotalprice}',style: TextStyle(fontSize: 14,color: AppColor.maincolor),),
             const Spacer(),

MaterialButton(
  color: AppColor.maincolorm1,
  onPressed:(){},child:const Text("Detels"),)      ],)

        ],),
      ),);
  }

}