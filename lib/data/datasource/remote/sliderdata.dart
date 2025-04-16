
import 'package:store313/core/classk/crud.dart';
import 'package:store313/linkapi.dart';

class Sliderdata {
  Crud crud;
  Sliderdata(this.crud);
  getdata()async{
    var response=await crud.postData(Applink.viewadvetisment,{});

   return response.fold((l)=>l,(r)=>r);
  }
}