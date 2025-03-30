
import 'package:store313/core/classk/crud.dart';
import 'package:store313/linkapi.dart';

class Checkoutdata {
  Crud crud;

  Checkoutdata(this.crud);

  checkout(Map data)async{
    var response=await crud.postData(Applink.checkout,data);

   return response.fold((l)=>l,(r)=>r);
  }
}