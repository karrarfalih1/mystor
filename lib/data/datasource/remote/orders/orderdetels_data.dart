
import 'package:store313/core/classk/crud.dart';
import 'package:store313/linkapi.dart';

class OrderdetelsData {
  Crud crud;

  OrderdetelsData(this.crud);

  getData(orderid)async{
    var response=await crud.postData(Applink.ordersdetels, {
      "cartorders":orderid
    });

   return response.fold((l)=>l,(r)=>r);
  }
}