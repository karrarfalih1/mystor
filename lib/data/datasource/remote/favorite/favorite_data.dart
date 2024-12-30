
import 'package:store313/core/classk/crud.dart';
import 'package:store313/linkapi.dart';

class Favorite {
  Crud crud;

  Favorite(this.crud);

  addFavorite(userid,itemsid)async{
    var response=await crud.postData(Applink.addFavorite, {
      "favorite_users_id":userid,
      "favorite_items_id":itemsid,
    });
   return response.fold((l)=>l,(r)=>r);
  }
deletFavorite(userid,itemsid)async{
    var response=await crud.postData(Applink.deletFavorite, {
      "favorite_users_id":userid,
      "favorite_items_id":itemsid,
    });
   return response.fold((l)=>l,(r)=>r);
  }

}