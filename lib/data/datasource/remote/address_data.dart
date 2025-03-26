
import 'package:store313/core/classk/crud.dart';
import 'package:store313/linkapi.dart';

class AddressData {
  Crud crud;

  AddressData(this.crud);

  addAddress(userid,name,street,city,lat,long)async{
    var response=await crud.postData(Applink.addressadd, {
     "usersid":userid,
     "name":name,
     "street":street,
     "city":city,
     "lat":lat,
     "long":long
    });
   return response.fold((l)=>l,(r)=>r);
  }
    addressview(userid)async{
    var response=await crud.postData(Applink.addressview, {
     "usersid":userid,
    });
   return response.fold((l)=>l,(r)=>r);
  }
  addressdelet(addressid)async{
    var response=await crud.postData(Applink.addressdelet, {
     "addressid":addressid,
    });
   return response.fold((l)=>l,(r)=>r);
  }
}