
import 'package:firabse_realtime/View/Screen/Auth_screen/signin.dart';
import 'package:firabse_realtime/View/Screen/Home/home_screen.dart';
import 'package:get/get.dart';

class AppRoute{

  ///<=============================== Route name =============================>

  static const String homeScreen="/homeScreen";
  static const String signInScreen="/signInScreen";


  static List<GetPage> routes=[
    GetPage(name: homeScreen, page: ()=> HomeScreen()),
    GetPage(name: signInScreen, page: ()=> SignInScreen()),

  ];


}