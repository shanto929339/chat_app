import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firabse_realtime/Core/AppRoute/approute.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController{

     Rx<User?> firebaseUser = Rx<User?>(null);


     final FirebaseAuth _auth = FirebaseAuth.instance;
     final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

     final TextEditingController nameController = TextEditingController();
     final TextEditingController emailController = TextEditingController();
     final TextEditingController passwordController = TextEditingController();


     ///<==================== This is for sign up =======================>

     Future<void> signUp() async {
          try {
                final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text,
                 );
                ///<===================== This is for save user info in database ===============>

                await _firebaseFirestore.collection("users").doc(_auth.currentUser?.uid).set({
                "name":nameController.text.trim(),
                "email":emailController.text.trim(),
                "status":"Unavailable",
                });
                Get.offAllNamed(AppRoute.signInScreen);
                update();
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
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
               );

               Get.offAllNamed(AppRoute.homeScreen) ;
               update();
               // Handle successful sign-in
               print('Signed in: ${userCredential.user}');

               // if(firebaseUser.value != null ){
               //  Get.offAllNamed(AppRoute.homeScreen) ;
               // }

          } catch (e) {
               //Get.snackbar("","${e}",colorText: AppColors.blackColor);
               print('Sign-in failed:=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= $e');
          }
     }

  ///<======================== This is for the sign out =========================>

     Future<void> signOut() async {
          try {
               await _auth.signOut();
               // Handle successful sign-out
               print('Signed out');
               Get.offAllNamed(AppRoute.signInScreen) ;
               update();
          } catch (e) {
               // Handle sign-out error
               print('Sign-out failed: $e');
          }
     }



     bool isLoggedIn() => firebaseUser.value != null;

     @override
  void onInit() {
          firebaseUser.bindStream(_auth.authStateChanges());
    super.onInit();
  }


}