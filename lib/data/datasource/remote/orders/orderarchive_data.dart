
import 'package:store313/core/classk/crud.dart';
import 'package:store313/linkapi.dart';
class OrderarchiveData {
  Crud crud;
  OrderarchiveData(this.crud);
  getData(usersid)async{
    var response=await crud.postData(Applink.ordersarchive, {
      "usersid":usersid
    });
   return response.fold((l)=>l,(r)=>r);
  }
    ratingdata(orderid,ratingnote,rating)async{
    var response=await crud.postData(Applink.rating, {
      "ordersid":orderid,
      "ratingnote":ratingnote,
      "rating":rating
    });
   return response.fold((l)=>l,(r)=>r);
  }
}