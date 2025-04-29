// اول صفحة ومن خلالها احدد اللغة

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/controller/home/adevetisment_controller.dart';
import 'package:store313/controller/home/home_controller.dart';
import 'package:store313/core/classk/handlingdataview.dart';
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
    controller.isSearch?ListItemsSearch(modelitemssearch:controller.listdatasearch):const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
         SilderImageHome()
        /*
               Customcardhome(
                    titlecard:controller.settings.isEmpty? '': '${controller.settings[0]['settings_title']}',
                    subtitlecard:controller.settings.isEmpty? '':   '${controller.settings[0]['settings_body']}',
                  ),*/
                  ,  Customtitlehome(title: 'الاقسام'),
                  ListCategorieshome(),
                   Customtitlehome(title: 'الاكثر  مبيعا'),
                   CustomListItemsHome(),
              
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