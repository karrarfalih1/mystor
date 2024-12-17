
import 'package:store313/core/classk/crud.dart';
import 'package:store313/linkapi.dart';

class Vrfiycodeforget {
  Crud crud;

  Vrfiycodeforget(this.crud);

  postdata(String email,String verfiycode)async{
    var response=await crud.postData(Applink.verfiycodeforget, {
        "email":email,
         "verfiycode":verfiycode,

    });

   return response.fold((l)=>l,(r)=>r);
  }
}