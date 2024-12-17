
import 'package:get/get.dart';
import 'package:store313/core/constantk/routesname.dart';
import 'package:store313/core/middleware/mymiddleware.dart';
import 'package:store313/view/screen/auth/forget/forgetpassword.dart';
import 'package:store313/view/screen/auth/login.dart';
import 'package:store313/view/screen/auth/forget/resetpassword.dart';
import 'package:store313/view/screen/auth/signup.dart';
import 'package:store313/view/screen/auth/forget/success_reset_password.dart';
import 'package:store313/view/screen/auth/success_signup.dart';
import 'package:store313/view/screen/auth/forget/verifycode.dart';
import 'package:store313/view/screen/auth/verifycodesignup.dart';
import 'package:store313/view/screen/home.dart';
import 'package:store313/view/screen/language.dart';
import 'package:store313/view/screen/onboarding.dart';


List<GetPage<dynamic>>? routes=[

  //test
  //GetPage(name: "/", page: ()=>const TestView()),
  //Auth
  GetPage(name: "/", page: ()=>const Languagek(),middlewares: [ Mymiddleware() ]),
   
  
 GetPage(name: Approute.login, page: ()=>const Login()),
 GetPage(name: Approute.signup, page: ()=>const SignUp()),
 GetPage(name: Approute.forgetpassword, page: ()=>const ForgetPassword()),
 GetPage(name: Approute.verfiycode, page: ()=>const VerfiyCode()),
 GetPage(name: Approute.resetpassword, page: ()=>const ResetPassword()),
 GetPage(name: Approute.successResetPassword, page: ()=>const Success_Reset_Password()),
 GetPage(name: Approute.successSignup, page: ()=>const Success_SignUp()),
 GetPage(name: Approute.verifyCodeSignUp, page: ()=>const VerifyCodeSignUp()),
 //onboarding
 GetPage(name: Approute.onboarding, page: ()=>const OnBoarding()),
 //home;
 GetPage(name: Approute.homepage, page: ()=>const homepage()),


];

