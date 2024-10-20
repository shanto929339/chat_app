import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firabse_realtime/Core/AppRoute/approute.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';

class HomController extends GetxController{

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
///<=================== This is for get user list ===========================>
     bool isLoading=false;
     List<String> userId=[];
     List<Map<String, dynamic>> userList = [];

     // List to store user data

  // Future<void> getUserList() async {
  //   User? user = FirebaseAuth.instance.currentUser;
  //
  //   isLoading=true;
  //   update();
  //   await _firebaseFirestore.collection("users").get().then((querySnapshot) {
  //
  //     userList.clear();
  //     for (var doc in querySnapshot.docs){
  //
  //       ///<=============== Add user data and user id =========================>
  //       userList.add(doc.data());
  //       userId.add(doc.id);
  //
  //     }
  //      isLoading=false;
  //
  //     update();
  //
  //     print("This is users list-=========================================${userList}");
  //
  //     print("This is users list-=========================================${userId}");
  //
  //   }).catchError((error) {
  //     isLoading=false;
  //     update();
  //     print("Error fetching users: $error");
  //   });
  // }

  Future<void> getUserList() async {
    User? currentUser = FirebaseAuth.instance.currentUser;

    isLoading = true;
    update();

    await _firebaseFirestore.collection("users").get().then((querySnapshot) {
      userList.clear();
      userId.clear();

      for (var doc in querySnapshot.docs) {
        // Exclude the current user's document by checking its ID
        if (doc.id != currentUser?.uid) {
          userList.add(doc.data());
          userId.add(doc.id);
        }
      }

      isLoading = false;
      update();

      print("This is the users list: $userList");
      print("This is the user IDs list: $userId");

    }).catchError((error) {
      isLoading = false;
      update();
      print("Error fetching users: $error");
    });
  }



  ///<=================== This is for the create chatRomId =============>
String chatRoomId="";

  createChatRoomID(String user1ID, String user2ID){
    // Sort the two user IDs to ensure the same ChatRoom ID is generated regardless of order
    if (user1ID.compareTo(user2ID) > 0) {

      chatRoomId="${user2ID}_$user1ID";
      update();// user2 comes first alphabetically
    } else {
      chatRoomId="${user1ID}_$user2ID";
      update();
      // user1 comes first alphabetically
    }
  }




  ///<=================== This is for the chatRomId save into the  server =============>

   Future<void> createChatRoom(String user1ID,String user2ID, List<String> users,)async{

     createChatRoomID(user1ID,user2ID);
     update();
     FirebaseFirestore.instance.collection('chatRooms').doc(chatRoomId).set({
       'users': users,
       'chatRoomID': chatRoomId,
       'createdAt': FieldValue.serverTimestamp(),
     }).then((value) {
       print("Chat Room created with ID: $chatRoomId");
     }).catchError((error) {
       print("Error creating Chat Room: $error");
     });
     Get.toNamed(AppRoute.chatScreen,arguments:chatRoomId);
     update();
   }

  String name = '';
///<============================= This is for get name =======================>

  getCurrentUserName() {
    // Get the current user
    User? user = FirebaseAuth.instance.currentUser;

    // Check if user is not null and displayName is set
    if (user != null) {
      name = user.displayName??"";
      update();
      print("this is the name display =-=-=-=-=-=-=-=-=-=-=-=-=-=--=-${name}");
    } else {
      // Set a default value if displayName is not set
      name = 'No display name';
    }

    print("This is the name: $name");

    update(); // Assuming this is for state management
  }


  @override
  void onInit() {
   getUserList();
    super.onInit();
  }
}