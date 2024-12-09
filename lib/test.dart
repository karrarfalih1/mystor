

import 'package:flutter/material.dart';
import 'package:store313/core/functionsk/checkinernet.dart';


void main(){
  runApp( test());
}

class test extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => teststate();

}

class teststate extends State<test>{

var res;
initaldata()async{
  res=await checkInternet();
   print("------------------------------$res");
}

void initState(){
  initaldata();
 
    super.initState();

}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:
 Scaffold(
      appBar: AppBar(title: Text("karrar"),),

    )
    );
    
    
  }

}