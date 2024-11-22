//لنتحقق من الادخالات في الحقول
//الادخالات هنا هي لاقل  قيمه  ولاعلى قيمه والى نوع القيمه 
import 'package:get/get.dart';

validInput(String val,int min,int  max,String type){
  if(type=="username"){
//للتحقق اذا كانت القيمه يوزر نيم ام لا 
    if(!GetUtils.isUsername(val)){
     return "not valid username";
    }
    
}
 if(type=="email"){
//للتحقق اذا كانت القيمه يوزر نيم ام لا 
    if(!GetUtils.isEmail(val)){
     return "not valid Email";
    }
  }
  if(type=="phone"){
//للتحقق اذا كانت القيمه يوزر نيم ام لا 
    if(!GetUtils.isPhoneNumber(val)){
     return "not valid phone";
    }
  }

if(val.length <min){
  return " value cant be less than $min";
}
if(val.length >max){
  return " value cant be larger than $max";
}
if(val.isEmpty){
   return " value cant be empty";
}
}