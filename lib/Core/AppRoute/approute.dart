
import 'package:firabse_realtime/View/Screen/Home/home_screen.dart';
import 'package:get/get.dart';

class AppRoute{

  ///<=============================== Route name =============================>

  static const String homeScreen="/homeScreen";


  static List<GetPage> routes=[
    GetPage(name: homeScreen, page: ()=> HomeScreen())

  ];


}