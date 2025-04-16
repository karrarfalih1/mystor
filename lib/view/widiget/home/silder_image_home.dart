import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:store313/controller/home/adevetisment_controller.dart';
import 'package:store313/core/classk/handlingdataview.dart';
import 'package:get/get.dart';
import 'package:store313/linkapi.dart';

class SilderImageHome extends GetView<AdevetismentController> {
 
  const SilderImageHome({super.key});
  @override
  Widget build(BuildContext context) {
    return  GetBuilder<AdevetismentController>(builder: (controller)=>
      Container( 
        padding:const EdgeInsets.only(top: 10),

         height: 200,
                          //  margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: HandlingDataView(statusRequest: controller.statusRequest, widget: 
                      PageView.builder(
                              controller: controller.pageController,
                              itemCount: controller.data.length,
                              onPageChanged: (index) {
                                controller.currenPage.value = index;
                              },
                              itemBuilder: (BuildContext context, int index) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      imageUrl:
                                          "${Applink.imagesitems}/${controller.data[index]["advertisment_image"]}"),
                                );
                              },
                            ),      )
                          )
    );
  }
}
