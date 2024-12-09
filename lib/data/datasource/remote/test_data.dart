
import 'package:store313/core/classk/crud.dart';
import 'package:store313/linkapi.dart';

class TestData {
  Crud crud;

  TestData(this.crud);

  getData()async{
    var response=await crud.postData(Applink.test, {});

   return response.fold((l)=>l,(r)=>r);
  }
}