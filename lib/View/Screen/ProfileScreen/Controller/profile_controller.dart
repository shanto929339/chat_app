import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController{

//
//
//   final ImagePicker picker = ImagePicker();
//   File? profileImage;
//   final TextEditingController nameController = TextEditingController();
//
//
//   ///<===================== Pick Image from Gallery ==========================>
//
//   Future<void> pickProfileImage() async {
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//
//       profileImage = File(pickedFile.path);
//       update();
//
//     }
//   }
//
//
//   ///<============================ Upload image i firestore ================>
//
//
//   Future<String?> uploadProfilePicture(File imageFile, String uid) async {
//     try {
//       Reference storageReference = FirebaseStorage.instance
//           .ref()
//           .child('profile_pictures')
//           .child('$uid.jpg');
//       UploadTask uploadTask = storageReference.putFile(imageFile);
//       TaskSnapshot snapshot = await uploadTask.whenComplete(() {});
//
//       // Get the download URL of the uploaded file
//       String downloadUrl = await snapshot.ref.getDownloadURL();
//       return downloadUrl;
//     } catch (e) {
//       print('Failed to upload profile picture: $e');
//       return null;
//     }
//   }
//
//
// ///<======================== Updaet Firestore================================>
//
//   Future<void> updateUserInFirestore(String uid, String displayName, String email, String photoURL) async {
//     try {
//       await FirebaseFirestore.instance.collection('users').doc(uid).update({
//         'name': displayName,
//         'email': email,
//         'profilePicture': photoURL,  // Save the profile picture URL
//       });
//       print('User data updated in Firestore');
//     } catch (e) {
//       print('Failed to update user data in Firestore: $e');
//     }
//   }
//
//
//   ///<============================ Update Profile ==============================>
//   Future<void> updateUserProfile(String displayName, String photoURL) async {
//     User? user = FirebaseAuth.instance.currentUser;
//
//     if (user != null) {
//       try {
//         await user.updateDisplayName(displayName);
//         await user.updatePhotoURL(photoURL);
//         await user.reload(); // Reload user information
//         print('User profile updated');
//       } catch (e) {
//         print('Failed to update user profile: $e');
//       }
//     }
//   }
//
//
//
//
//
//   Future<void> updateProfile() async {
//     User? user = FirebaseAuth.instance.currentUser;
//
//     if (user != null && profileImage != null) {
//       // 1. Upload profile picture to Firebase Storage
//       String? photoURL = await uploadProfilePicture(profileImage!, user.uid);
//
//       if (photoURL != null) {
//         // 2. Update Firebase Auth User Profile
//         await updateUserProfile(nameController.text.trim(), photoURL);
//
//         // 3. Save User Data in Firestore (Optional)
//         await updateUserInFirestore(
//           user.uid,
//           nameController.text.trim(),
//           user.email!,
//           photoURL,
//         );
//
//        Get.snackbar("",'Profile updated successfully!');
//       } else {
//         Get.snackbar("",'Failed to upload profile picture.');
//       }
//     } else {
//       Get.snackbar("",'Please select a profile picture.');
//     }
//   }

  final ImagePicker picker = ImagePicker();
  File? profileImage;
  final TextEditingController nameController = TextEditingController();

  ///<===================== Pick Image from Gallery =========================>
  Future<void> pickProfileImage() async {
  try {
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  if (pickedFile != null) {
  profileImage = File(pickedFile.path);
  update();
  } else {
  Get.snackbar('Image Error', 'No image selected.');
  }
  } catch (e) {
  print('Error picking image: $e');
  Get.snackbar('Error', 'Failed to pick image. Try again.');
  }
  }

  ///<======================== Upload image to Firestore ===================>
  Future<String?> uploadProfilePicture(File imageFile, String uid) async {
  try {
  Reference storageReference = FirebaseStorage.instance
      .ref()
      .child('profile_pictures')
      .child('$uid.jpg');
  UploadTask uploadTask = storageReference.putFile(imageFile);
  TaskSnapshot snapshot = await uploadTask.whenComplete(() => {});

  // Get the download URL of the uploaded file
  String downloadUrl = await snapshot.ref.getDownloadURL();
  return downloadUrl;
  } catch (e) {
  print('Failed to upload profile picture: $e');
  Get.snackbar('Upload Error', 'Failed to upload profile picture.');
  return null;
  }
  }

  ///<======================== Update Firestore ============================>
  Future<void> updateUserInFirestore(String uid, String displayName, String email, String photoURL) async {
  try {
  await FirebaseFirestore.instance.collection('users').doc(uid).update({
  'name': displayName,
  'email': email,
  'profilePicture': photoURL, // Save the profile picture URL
  });
  print('User data updated in Firestore');
  } catch (e) {
  print('Failed to update user data in Firestore: $e');
  Get.snackbar('Firestore Error', 'Failed to update user data in Firestore.');
  }
  }

  ///<======================== Update Firebase Auth User Profile ===========>
  Future<void> updateUserProfile(String displayName, String photoURL) async {
  User? user = FirebaseAuth.instance.currentUser;

  if (user != null) {
  try {
  await user.updateDisplayName(displayName);
  await user.updatePhotoURL(photoURL);
  await user.reload(); // Reload user information
  print('User profile updated in Firebase Auth');
  } catch (e) {
  print('Failed to update Firebase Auth profile: $e');
  Get.snackbar('Profile Update Error', 'Failed to update Firebase Auth profile.');
  }
  } else {
  Get.snackbar('User Error', 'No authenticated user found.');
  }
  }

  ///<======================== Update Profile ==============================>
  Future<void> updateProfile() async {
  User? user = FirebaseAuth.instance.currentUser;

  if (user != null && profileImage != null) {

  String? photoURL = await uploadProfilePicture(profileImage!, user.uid);

  if (photoURL != null) {
  // 2. Update Firebase Auth User Profile
  await updateUserProfile(nameController.text.trim(), photoURL);

  // 3. Save User Data in Firestore
  await updateUserInFirestore(
  user.uid,
  nameController.text.trim(),
  user.email!,
  photoURL,
  );

  // Notify the user
  Get.snackbar('Success', 'Profile updated successfully!');
  } else {
  Get.snackbar('Upload Error', 'Failed to upload profile picture.');
  }
  } else {
  Get.snackbar('Input Error', 'Please select a profile picture.');
  }

  }



}