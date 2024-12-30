
import 'package:store313/core/classk/crud.dart';
import 'package:store313/linkapi.dart';

class ItemsData{
  Crud crud;

  ItemsData(this.crud);

  postdata(String selectCat,userid)async{
    var response=await crud.postData(Applink.items,{
     "selectCat":selectCat,
     "userid":userid
    });

  return response.fold((l)=>l,(r)=>r);
  }
}