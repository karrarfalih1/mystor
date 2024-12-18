//كلاس للربط بين الباك ايند والفرونت ايند 

import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:store313/core/classk/statusRequest.dart';
import 'package:store313/core/functionsk/checkinernet.dart';
import 'package:http/http.dart' as http;
class Crud {


  Future<Either<StatusRequest,Map>> postData(String linkurl, Map data)async{

      //يتحقق اذا اكو اتصال بالانترنيت او لاي
    if(await checkInternet()){
      // ادخال لنك الصفحة الي اريد اوصل الها والبيانات 
      var response=await http.post(Uri.parse(linkurl),body: data);
      //اذا وجد الصفحة وتم الاتصال بنجاح
      if(response.statusCode==403){
        print("33333333333333333333333333333333333333333333333333333333333333333333333333");
      }
      if(response.statusCode==404){
         print("4444444444444444444444444444444444444444444444444444444444444444444444444444444444444");
      }
      if(response.statusCode==200|| response.statusCode==201){
               print("---------------------------");
        print(response);
        Map responsebody =jsonDecode(response.body);
        print(responsebody);
        return Right(responsebody);

      }else if(response.statusCode==404){
        return const Left(StatusRequest.serverfailure);
      }else{
        print("0000000000000");
        print(response);
        return const Left(StatusRequest.none);
      }


    }else{
      return const Left(StatusRequest.offlinefailure);
}




  }
  }