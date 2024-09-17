import 'dart:async';
import 'package:firabse_realtime/Core/AppRoute/approute.dart';
import 'package:firabse_realtime/View/Screen/Auth_screen/Controller/auth_controller.dart';
import 'package:firabse_realtime/View/widgets/custom_button/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatefulWidget {


   VerifyEmailScreen();

  @override
  _VerifyEmailScreenState createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {

   var user=Get.arguments;

   AuthController controller =Get.find<AuthController>();


  // Timer? timer;
  // bool isEmailVerified = false;

  @override
  void initState() {
    super.initState();

  controller.timer = Timer.periodic(const Duration(seconds: 5), (timer) async {
      await controller.checkEmailVerified();
    });
  }

  // Future<void> checkEmailVerified() async {
  //   User? user = FirebaseAuth.instance.currentUser;
  //   await user?.reload(); // Reload the user state
  //   user = FirebaseAuth.instance.currentUser;
  //
  //   if (user != null && user.emailVerified) {
  //     timer?.cancel(); // Stop the timer once email is verified
  //     setState(() {
  //       isEmailVerified = true;
  //     });
  //     // Navigate to the sign-in screen
  //     Get.offAllNamed(AppRoute.signInScreen);
  //   }
  // }

  @override
  void dispose() {
   controller .timer?.cancel(); // Cancel the timer when the screen is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify Your Email"),
      ),
      body: Center(
        child: controller.isEmailVerified
            ? const Text("Email Verified! Redirecting to sign-in...")
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("A verification email has been sent to your email."),
            const SizedBox(height: 20),
            CustomButton(
              onTap: () async {
                await controller.checkEmailVerified();
              },
              title: "I've verified my email",
            ),

             SizedBox(height: 50.h),

            CustomButton(
              onTap: () async {
                await user.sendEmailVerification();
                Get.snackbar(
                  'Email Sent',
                  'A new verification email has been sent.',
                  snackPosition: SnackPosition.TOP,
                );
              },
              title:"Resend Verification Email",
            ),
          ],
        ),
      ),
    );
  }
}
