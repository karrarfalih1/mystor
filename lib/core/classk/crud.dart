//كلاس للربط بين الباك ايند والفرونت ايند 

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:store313/core/classk/statusRequest.dart';
import 'package:store313/core/functionsk/checkinernet.dart';
import 'package:http/http.dart' as http;
class Crud {


  Future<Either<StatusRequest,Map>> postData(String linkurl, Map data)async{
try{
      //يتحقق اذا اكو اتصال بالانترنيت او لاي
    if(await checkInternet()){
      // ادخال لنك الصفحة الي اريد اوصل الها والبيانات 
      var response=await http.post(Uri.parse(linkurl),body: data);
      //اذا وجد الصفحة وتم الاتصال بنجاح
      if(response.statusCode==200|| response.statusCode==201){
        Map responsebody =jsonDecode(response.body);
        return Right(responsebody);

      }else{
        return const Left(StatusRequest.serverfailure);
      }


    }else{
      return const Left(StatusRequest.offlinefailure);
    }


}catch(_){
  return const Left(StatusRequest.serverfailure);

}

  }
}