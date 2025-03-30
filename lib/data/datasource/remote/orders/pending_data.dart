
import 'package:store313/core/classk/crud.dart';
import 'package:store313/linkapi.dart';

class PendingData {
  Crud crud;

  PendingData(this.crud);

  getData(usersid)async{
    var response=await crud.postData(Applink.vieworders, {
      "usersid":usersid
    });

   return response.fold((l)=>l,(r)=>r);
  }
}