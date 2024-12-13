
import 'package:store313/core/classk/crud.dart';
import 'package:store313/linkapi.dart';

class LoginData{
  Crud crud;

  LoginData(this.crud);

  postdata(String email,String password)async{
    var response=await crud.postData(Applink.logIn, {
   "email":email, 
    "password":password

    });

   return response.fold((l)=>l,(r)=>r);
  }
}