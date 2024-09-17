import 'package:firabse_realtime/View/Screen/ProfileScreen/Controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UpdateProfileScreen extends StatefulWidget {
  @override
  _UpdateProfileScreenState createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {

  // final ImagePicker _picker = ImagePicker();
  // File? _profileImage;
  // final TextEditingController _nameController = TextEditingController();
  //
  // // Pick image from gallery
  // Future<void> _pickProfileImage() async {
  //   final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
  //   if (pickedFile != null) {
  //     setState(() {
  //       _profileImage = File(pickedFile.path);
  //     });
  //   }
  // }
  //
  // Future<void> _updateProfile() async {
  //   User? user = FirebaseAuth.instance.currentUser;
  //
  //   if (user != null && _profileImage != null) {
  //     // 1. Upload profile picture to Firebase Storage
  //     String? photoURL = await uploadProfilePicture(_profileImage!, user.uid);
  //
  //     if (photoURL != null) {
  //       // 2. Update Firebase Auth User Profile
  //       await updateUserProfile(_nameController.text.trim(), photoURL);
  //
  //       // 3. Save User Data in Firestore (Optional)
  //       await updateUserInFirestore(
  //         user.uid,
  //         _nameController.text.trim(),
  //         user.email!,
  //         photoURL,
  //       );
  //
  //       // Show success message
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('Profile updated successfully!')),
  //       );
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('Failed to upload profile picture.')),
  //       );
  //     }
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Please select a profile picture.')),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: const Text('Update Profile')),
      body: GetBuilder<ProfileController>(
        builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap:(){
                    controller.pickProfileImage ( );
                  } ,//_pickProfileImage,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage:   controller. profileImage != null
                        ? FileImage( controller.profileImage!)
                        : NetworkImage(FirebaseAuth.instance.currentUser?.photoURL ?? 'https://beforeigosolutions.com/wp-content/uploads/2021/12/dummy-profile-pic-300x300-1.png'),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller:controller. nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed:controller. updateProfile,
                  child: const Text('Update Profile'),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
