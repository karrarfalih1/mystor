
import 'package:store313/core/classk/crud.dart';
import 'package:store313/linkapi.dart';

class NotifayData {
  Crud crud;

  NotifayData(this.crud);

  getntefy(String usersid)async{
    var response=await crud.postData(Applink.notification,{
      "usersid":usersid
    });

   return response.fold((l)=>l,(r)=>r);
  }
}