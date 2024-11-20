import 'package:flutter/material.dart';
import 'package:store313/core/constantk/routesname.dart';
import 'package:store313/view/screen/auth/login.dart';
import 'package:store313/view/screen/onboarding.dart';

Map<String,Widget Function (BuildContext)>routes={
 Approute.login:(context)=>const Login(),
 Approute.onboarding:(context)=>const OnBoarding()

};