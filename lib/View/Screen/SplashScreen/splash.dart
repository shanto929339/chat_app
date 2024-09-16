import 'package:firabse_realtime/Core/AppRoute/approute.dart';
import 'package:firabse_realtime/utils/AppColors/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

    navigate(){
    Future.delayed(Duration(seconds: 3),() {
      final User? user = FirebaseAuth.instance.currentUser;
      if(user!=null){
        Get.offAllNamed(AppRoute.homeScreen);
      }else{
        Get.toNamed(AppRoute.signInScreen);
      }
    },);
  }

  @override
  void initState() {
      WidgetsBinding.instance.addPostFrameCallback((_){
       navigate();
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          body: Container(
           height: double.maxFinite,
           width: double.maxFinite,
           color: AppColors.authButtonColor.withOpacity(.4),
           child: Center(

           child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Padding(
               padding:EdgeInsets.symmetric(horizontal: 10.w),
               child: LinearProgressIndicator(
               color: AppColors.white,
                           backgroundColor: AppColors.authButtonColor,
                           borderRadius: BorderRadius.circular(8),
                           ),
             )
           ],
           ),
           ),
          ),
    );
  }
}
