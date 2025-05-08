
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/controller/home/home_controller.dart';
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
          "الذهاب الى السلة",
          style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body:GetBuilder<ItemsdetelsControllerImp>(builder: (controller)=>HandlingDataView(statusRequest: controller.statusRequest, widget:  Container(
            child: ListView(
          children: [
          const  Imageitemscustom(),
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
                      String retid=myservices.sharedPreferences.getString("retid").toString();
                       String retC=myservices.sharedPreferences.getString("retC").toString();
                      if(retid=="null" ||retC=="0" || retid==controller.itemsModel.itemsCat.toString()){
                        myservices.sharedPreferences.setString("retid",controller.itemsModel.itemsCat.toString());
                        retid=myservices.sharedPreferences.getString("retid").toString();
                         controller.add();
                         
      Get.rawSnackbar(
            animationDuration: const Duration(milliseconds: 900),
        snackPosition: SnackPosition.TOP,
        barBlur: 0.01,
        backgroundColor:  AppColor.maincolor,
        borderColor: AppColor.maincolor,
        title: "اشعار", messageText:  Text("${myservices.sharedPreferences.getString("retid")}",style:const  TextStyle(fontSize: 20,color: Colors.white),));
                      }else{
                        
        Get.rawSnackbar(
        animationDuration: const Duration(milliseconds: 600),
        snackPosition: SnackPosition.TOP,
        barBlur: 0.01,
        backgroundColor:  AppColor.maincolor,
        borderColor: AppColor.maincolor,
        title: "اشعار", messageText: const Text(" يجب اكمال  عملية الشراء  او افراغها لتتمكن من الشراء من مطعم اخر",style:  TextStyle(fontSize: 20,color: Colors.white),));
                      }
                  
                     
                    },
                    onpressedmains: () async{
                 
                          controller.remove();
                    
                    },
                    price: '${controller.itemsModel.itemspricediscount!.toInt()}',
                    count: '${controller.countitems}',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${controller.itemsModel.itemsDesc}",
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
               
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
