
import 'package:store313/core/classk/crud.dart';
import 'package:store313/linkapi.dart';

class Verfiycodesignup{
  Crud crud;

  Verfiycodesignup(this.crud);

  postData(String email,String verfiycode)async{
    var response=await crud.postData(Applink.verfiycodesignup, {
   "email":email,
   "verfiycode":verfiycode,
    });
   return response.fold((l)=>l,(r)=>r);
  }
  recode(String email)async{
    var response=await crud.postData(Applink.reverfiycode, {
   "email":email,
    });
   return response.fold((l)=>l,(r)=>r);
  }

}