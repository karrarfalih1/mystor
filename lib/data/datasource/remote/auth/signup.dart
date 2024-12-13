
import 'package:store313/core/classk/crud.dart';
import 'package:store313/linkapi.dart';

class SignUpData{
  Crud crud;

  SignUpData(this.crud);

  postdata(String username,String email,String phone,String password)async{
    var response=await crud.postData(Applink.signUp, {
   "username":username,
   "email":email,
    "phone":phone,
    "password":password

    });

   return response.fold((l)=>l,(r)=>r);
  }
}