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
                        : NetworkImage(FirebaseAuth.instance.currentUser?.photoURL ?? 'data:image/png;base64,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'),
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
