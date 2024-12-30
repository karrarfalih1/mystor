
import 'package:store313/core/classk/crud.dart';
import 'package:store313/linkapi.dart';

class FavoriteScreenData {
  Crud crud;

  FavoriteScreenData(this.crud);

  getFavorite(userid)async{
    var response=await crud.postData(Applink.viewFavorite, {
      "userid":userid
    });
   return response.fold((l)=>l,(r)=>r);
  }
    deletFavorite(favorite_id)async{
    var response=await crud.postData(Applink.deletfromFavorite, {
      "favorite":favorite_id
    });
   return response.fold((l)=>l,(r)=>r);
  }

}