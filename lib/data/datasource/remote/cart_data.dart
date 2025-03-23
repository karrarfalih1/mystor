
import 'package:store313/core/classk/crud.dart';
import 'package:store313/linkapi.dart';

class CartData {
  Crud crud;

  CartData(this.crud);

  addcart(userid,itemsid)async{
    var response=await crud.postData(Applink.cartadd, {
      "usersid":userid,
      "itemsid":itemsid,
    });
   return response.fold((l)=>l,(r)=>r);
  }
deletcart(userid,itemsid)async{
    var response=await crud.postData(Applink.cartdelet, {
      "usersid":userid,
      "itemsid":itemsid,
    });
   return response.fold((l)=>l,(r)=>r);
  }

  getcountcart(userid,itemsid)async{
    var response=await crud.postData(Applink.cartgetcount, {
      "usersid":userid,
      "itemsid":itemsid,
    });
   return response.fold((l)=>l,(r)=>r);
  }
  viewcart(userid)async{
    var response=await crud.postData(Applink.cartview, {
      "usersid":userid,
     
    });
   return response.fold((l)=>l,(r)=>r);
  }
}