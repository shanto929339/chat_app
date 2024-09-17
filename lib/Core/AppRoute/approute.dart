
import 'package:firabse_realtime/View/Screen/Auth_screen/SIgnUpScreen/signup.dart';
import 'package:firabse_realtime/View/Screen/Auth_screen/VerifyScreen/verify_screen.dart';
import 'package:firabse_realtime/View/Screen/Auth_screen/signin.dart';
import 'package:firabse_realtime/View/Screen/ChatScreen/chat_screen.dart';
import 'package:firabse_realtime/View/Screen/Home/home_screen.dart';
import 'package:firabse_realtime/View/Screen/ProfileScreen/profile.dart';
import 'package:firabse_realtime/View/Screen/SplashScreen/splash.dart';
import 'package:get/get.dart';

class AppRoute{

  ///<=============================== Route name =============================>

  static const String splashScreen="/splashScreen";
  static const String homeScreen="/homeScreen";
  static const String signInScreen="/signInScreen";
  static const String chatScreen="/chatScreen";
  static const String signUpScreen="/signUpScreen";
  static const String verifyScreen="/verifyScreen";
  static const String profileScreen="/profileScreen";


  static List<GetPage> routes=[
    GetPage(name: splashScreen, page: ()=> SplashScreen()),
    GetPage(name: homeScreen, page: ()=> HomeScreen()),
    GetPage(name: signInScreen, page: ()=> SignInScreen()),
    GetPage(name: signUpScreen, page: ()=> SignUpScreen()),
    GetPage(name: chatScreen, page: ()=> ChatScreen()),
    GetPage(name: verifyScreen, page: ()=> VerifyEmailScreen()),
    GetPage(name: profileScreen, page: ()=> UpdateProfileScreen()),
  ];


}