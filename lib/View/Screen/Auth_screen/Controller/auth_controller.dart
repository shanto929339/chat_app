import 'package:firabse_realtime/Helper/shared_pefarance_helper.dart';
import 'package:firabse_realtime/utils/AppColors/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController{


     final FirebaseAuth _auth = FirebaseAuth.instance;
     final TextEditingController emailController = TextEditingController();
     final TextEditingController passwordController = TextEditingController();


     ///<==================== This is for sign up =======================>

     Future<void> signUp() async {
          try {
               final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text,
               );
               // Handle successful sign-up
               print('Signed up: ${userCredential.user}');
          } catch (e) {
               // Handle sign-up error
               print('Sign-up failed: $e');
          }
     }


   ///<================== This is for sign in ===============================>

     Future<void> signIn() async {
          try {
               final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text,
               );
           bool sp=  await SharePrefsHelper.setBool(SharedPreferenceValue.isUserLogedIn, true);

              print("This is the sign in vlaue =====================${sp}");

               // Handle successful sign-in
               print('Signed in: ${userCredential.user}');

          } catch (e) {
               Get.snackbar("","${e}",colorText: AppColors.blackColor);
               print('Sign-in failed:=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= $e');
          }
     }



  ///<======================== This is for the sign out =========================>

     Future<void> signOut() async {
          try {
               await _auth.signOut();
               // Handle successful sign-out
               print('Signed out');
          } catch (e) {
               // Handle sign-out error
               print('Sign-out failed: $e');
          }
     }

}