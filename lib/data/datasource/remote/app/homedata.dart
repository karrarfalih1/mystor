
import 'package:store313/core/classk/crud.dart';
import 'package:store313/linkapi.dart';

class HomeData{
  Crud crud;

  HomeData(this.crud);

  postdata()async{
    var response=await crud.postData(Applink.home, {});

  return response.fold((l)=>l,(r)=>r);
  }

    searchdata(String search)async{
    var response=await crud.postData(Applink.search, {
      "search":search
    });

  return response.fold((l)=>l,(r)=>r);
  }
}