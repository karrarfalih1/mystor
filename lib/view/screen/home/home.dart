// اول صفحة ومن خلالها احدد اللغة

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:store313/controller/home/adevetisment_controller.dart';
import 'package:store313/controller/home/home_controller.dart';
import 'package:store313/core/classk/handlingdataview.dart';
import 'package:store313/core/constantk/imagesasset.dart';
import 'package:store313/core/localizationk/changelocal.dart';
import 'package:store313/data/model/itemsmodel.dart';
import 'package:store313/linkapi.dart';
import 'package:store313/view/widiget/castomappbar.dart';
import 'package:store313/view/widiget/home/categoreshomewidiget.dart';
import 'package:store313/view/widiget/home/cuostomitemslisthome.dart';
import 'package:store313/view/widiget/home/customtitlehome.dart';
import 'package:store313/view/widiget/home/silder_image_home.dart';

class Homepage extends GetView<LocaleController> {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
Get.put(AdevetismentController());
    return GetBuilder<HomeControllerImp>(
        builder: (controller) =>  Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListView(
                children: [
                       CustomAppBar(
                        mycontroller: controller.search! ,
                        onChanged: (val){
                          controller.checksearch(val);
                        },
                        title:"6".tr ,  onPressedSearsh: () { controller.onsearchItems(); },onPressednotifcation: () {
                          controller.goToNotification();
                          },),
              HandlingDataView(
            statusRequest: controller.statusRequest,
            widget:
    controller.isSearch?ListItemsSearch(modelitemssearch:controller.listdatasearch): Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
         const SilderImageHome()
        /*
               Customcardhome(
                    titlecard:controller.settings.isEmpty? '': '${controller.settings[0]['settings_title']}',
                    subtitlecard:controller.settings.isEmpty? '':   '${controller.settings[0]['settings_body']}',
                  ),*/,
                  controller.order.isNotEmpty?
    GetBuilder<HomeControllerImp>(builder: (controller)=>
     Container(
   child: EasyStepper(
        activeStep: 0,
        activeStepTextColor: Colors.green,
        finishedStepTextColor: Colors.green,
        
        internalPadding: 0,
        showLoadingAnimation: false,
        stepRadius: 25,
        showStepBorder: true,
       
        steps: [
          EasyStep(
            
         customStep: CircleAvatar(
         //     radius: 40,
               backgroundColor: Colors.green[200],
              child: Lottie.asset(
                repeat: controller.order[0]['orders_status']==0?true:false,
                AppImagesasset.Loading,width: 60),
            ),
            title: 'انتضار${controller.order.isNotEmpty?controller.order[0]['orders_id']:"k"}',
            
          ),
          EasyStep(
            customStep: CircleAvatar(
           //   radius: 40,
              backgroundColor: Colors.green[200],
              child: Lottie.asset(repeat: controller.order[0]['orders_status']==1?true:false,
                AppImagesasset.laycatt,width: 60),
            ),
           title: 'يتم التحضير',
            topTitle: true,
          ),
           EasyStep(
            customStep: CircleAvatar(
             // radius: 40,
              backgroundColor: Colors.white,
              child: Lottie.asset(repeat: controller.order[0]['orders_status']==2?true:false,
                AppImagesasset.layBaik,width: 60),
            ),
            title: 'على الطريق',
          ),
          const EasyStep(
            customStep: CircleAvatar(
              radius: 9,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 7,
                backgroundColor:
                    2 >= 3 ? Colors.orange : Colors.white,
              ),
            ),
            title: 'تم التسليم ',
            topTitle: true,
          ),
    
        ],
    
         ),
    )
    )
    :const Text(""),
     
                const   Customtitlehome(title: 'المطاعم'),
                const   ListCategorieshome(),
                const   Customtitlehome(title: 'الاكثر  مبيعا'),
                const   CustomListItemsHome(),
              
         ],))
                ],
              ),
            ));
  }
}


class ListItemsSearch extends GetView<HomeControllerImp>{
  final List<ItemsModel> modelitemssearch;
  const ListItemsSearch({super.key, required this.modelitemssearch});


  @override
  Widget build(BuildContext context) {
  return ListView.builder(
    itemCount: modelitemssearch.length,
    physics:const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemBuilder: (context,index){
      return InkWell(
        onTap: (){
        controller.goToItemsDeletes(modelitemssearch[index]);  
        },
        child: SizedBox(
          child: Card(
            child: Container(
              padding:const EdgeInsets.all(10),
              child: Row(children: [
                Expanded(child:CachedNetworkImage(imageUrl: "${Applink.imagesitems}/${modelitemssearch[index].itemsImage}",fit:BoxFit.cover,height: 100,)),
            Expanded(
        flex: 2,
        child:
        ListTile(title:Text("${ modelitemssearch[index].itemsName}"),
        subtitle:Text("${ modelitemssearch[index].categoriesName}") ,
        ),
        
         )
              ],),
            ),
          ),
        ),
      );
    }

  );
  }

}