import 'package:firabse_realtime/Core/AppRoute/approute.dart';
import 'package:firabse_realtime/View/Screen/Auth_screen/Controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  //AuthController controller=Get.find<AuthController>();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(actions: [
           GetBuilder<AuthController>(
             builder: (controller) {
               return IconButton(onPressed:(){
                       controller.signOut();
                       controller.update();
                     }, icon:const Icon(Icons.logout));
             }
           )],),
    );
  }
}
