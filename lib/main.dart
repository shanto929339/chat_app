import 'package:firabse_realtime/Core/AppRoute/approute.dart';
import 'package:firabse_realtime/Core/Dependancy/dependancy.dart';
import 'package:firabse_realtime/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main()async {
  DependancyInjection di=DependancyInjection();
  di.dependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(375, 812),
      child: GetMaterialApp(
        defaultTransition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 200),
        initialRoute: AppRoute.splashScreen,
        navigatorKey: Get.key,
        getPages: AppRoute.routes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
