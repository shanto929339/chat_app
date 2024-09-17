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

     // Future<void> signUp() async {
     //   try {
     //     final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
     //       email: emailController.text.trim(),
     //       password: passwordController.text.trim(),
     //     );
     //     User? user = userCredential.user;
     //
     //     if (user != null) {
     //       await user.updateDisplayName(nameController.text.trim());
     //       await user.reload();
     //       user = _auth.currentUser;
     //       await _firebaseFirestore.collection("users").doc(user?.uid).set({
     //       "name": nameController.text.trim(),
     //       "email": emailController.text.trim(),
     //       "status": "Unavailable",
     //       });
     //       Get.offAllNamed(AppRoute.signInScreen);
     //       update();
     //       print('Signed up: ${user?.displayName}');
     //     }
     //   } catch (e) {
     //     print('Sign-up failed: $e');
     //   }
     // }



     Future<void> signUp() async {
       try {
         final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
           email: emailController.text.trim(),
           password: passwordController.text.trim(),
         );

         User? user = userCredential.user;

         if (user != null) {
           // Update user's display name
           await user.updateDisplayName(nameController.text.trim());
           await user.reload();
           user = _auth.currentUser;

           // Send email verification
           if (!user!.emailVerified) {
             await user?.sendEmailVerification();
             print('Verification email sent to ${user?.email}');
           }

           // Store user info in Firestore
           await _firebaseFirestore.collection("users").doc(user?.uid).set({
             "name": nameController.text.trim(),
             "email": emailController.text.trim(),
             "status": "Unavailable",
           });

           // Notify the user to verify their email before continuing
           Get.snackbar(
             'Verify Email',
             'A verification email has been sent to ${user?.email}. Please verify before logging in.',
             snackPosition: SnackPosition.BOTTOM,
           );

           // Sign out the user until they verify the email
           await _auth.signOut();

           // Optionally, navigate to the sign-in screen
           Get.offAllNamed(AppRoute.signInScreen);
           print('Signed up: ${user?.displayName}');
         }
       } catch (e) {
         print('Sign-up failed: $e');
         // Optionally, you can show a snackbar or dialog here to notify the user about the error
         Get.snackbar('Sign-Up Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
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
                    print('Signed in: ${userCredential.user}');
          } catch (e) {
               Get.snackbar("",'Sign-in failed:=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-= $e');
          }
     }

  ///<======================== This is for the sign out =========================>

     Future<void> signOut() async {
          try {
               await _auth.signOut();
               Get.snackbar("","Signed out");
               Get.offAllNamed(AppRoute.signInScreen) ;
               update();
          } catch (e) {
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