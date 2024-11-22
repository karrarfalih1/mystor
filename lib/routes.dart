import 'package:flutter/material.dart';
import 'package:store313/core/constantk/routesname.dart';
import 'package:store313/view/screen/auth/chjeckemail.dart';
import 'package:store313/view/screen/auth/forget/forgetpassword.dart';
import 'package:store313/view/screen/auth/login.dart';
import 'package:store313/view/screen/auth/forget/resetpassword.dart';
import 'package:store313/view/screen/auth/signup.dart';
import 'package:store313/view/screen/auth/forget/success_reset_password.dart';
import 'package:store313/view/screen/auth/success_signup.dart';
import 'package:store313/view/screen/auth/forget/verifycode.dart';
import 'package:store313/view/screen/onboarding.dart';

Map<String,Widget Function (BuildContext)>routes={
  //Auth
 Approute.login:(context)=>const Login(),
 Approute.signup:(context)=>const SignUp(),
 Approute.forgetpassword:(context)=>const ForgetPassword(),
  Approute.verfiycode:(context)=>const VerfiyCode(),
   Approute.resetpassword:(context)=>const ResetPassword(),
    Approute.successResetPassword:(context)=>const Success_Reset_Password(),
    Approute.successSignup:(context)=>const Success_SignUp(),
     Approute.checkEmail:(context)=>const CheckEmail(),
    
    
//OnBoarding
 Approute.onboarding:(context)=>const OnBoarding()

};