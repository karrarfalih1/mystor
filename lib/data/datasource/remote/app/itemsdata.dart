
import 'package:store313/core/classk/crud.dart';
import 'package:store313/linkapi.dart';

class ItemsData{
  Crud crud;

  ItemsData(this.crud);

  postdata(String selectCat)async{
    var response=await crud.postData(Applink.items,{
     "selectCat":selectCat
    });

  return response.fold((l)=>l,(r)=>r);
  }
}