
import 'package:store313/core/classk/crud.dart';
import 'package:store313/linkapi.dart';

class Offersviewdata {
  Crud crud;

  Offersviewdata(this.crud);

  getdata(userid)async{
    var response=await crud.postData(Applink.offers,{
      "userid":userid
    });
   return response.fold((l)=>l,(r)=>r);
  }
}