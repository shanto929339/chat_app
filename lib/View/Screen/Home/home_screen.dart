
import 'package:firabse_realtime/View/Screen/Auth_screen/Controller/auth_controller.dart';
import 'package:firabse_realtime/View/Screen/Home/Controller/hom_controller.dart';
import 'package:firabse_realtime/View/widgets/custom_image/custom_image.dart';
import 'package:firabse_realtime/View/widgets/custom_text/custom_text.dart';
import 'package:firabse_realtime/View/widgets/custom_text_field/custom_text_field.dart';
import 'package:firabse_realtime/utils/AppColors/app_colors.dart';
import 'package:firabse_realtime/utils/app_images/app_images.dart';
import 'package:firabse_realtime/utils/app_strings/app_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(actions: [
           GetBuilder<AuthController>(
             builder: (controller) {
               return IconButton(onPressed:(){
                       controller.signOut();
                       controller.update();
                     }, icon:const Icon(Icons.logout));
             }
           )],),

      body: GetBuilder<HomController>(
        builder: (controller) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 25.h),
            child:Column(
             children: [

               ///<========================= This is the search field ====================>

               Row(
                 children: [
                   Expanded(
                     flex: 8,
                     child: CustomTextField(
                       onTapClick: (){
                        // Get.toNamed(AppRoute.searchNearbyScreen);
                       },
                       fillColor: AppColors.white,
                       fieldBorderColor: AppColors.labelColor,
                       hintText: AppStrings.searchHere,
                       hintStyle: TextStyle(color: AppColors.authButtonColor, fontSize: 14.sp),
                       isPrefixIcon: true,
                       prefixIcon: Padding(
                         padding: EdgeInsets.only(left: 12.w),
                         child: Icon(
                           Icons.search,
                           color: AppColors.authButtonColor,
                           size: 24.sp,
                         ),
                       ),
                     ),
                   ),
                   SizedBox(width: 14.w),
                 ],
               ),

               ///<======================== This is the Friend list ====================>

               Column(
               children:List.generate(controller.userList?.length??0,(index) {
                 return Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: ListTile (
                   onTap: ()async{
                     User? user = FirebaseAuth.instance.currentUser;
                     String id=user!.uid.toString();
                     print("======================================== This is the user id${id}");
                   //Get.toNamed(AppRoute.chatScreen);
                     controller.createChatRoom(id,controller.userId[index].toString(),["${id.toString()}","${controller.userId[index].toString()}"] );
                     controller.update();
                   },
                     ///<===================== Image section ==================>
                   leading: CustomImage(imageSrc:AppImages.bankImage,imageType: ImageType.png,size: 40.r,fit: BoxFit.cover,),
                     ///<===================== Name section ===================>
                   title: CustomText(text:"${controller.userList[index]["name"]}",textAlign: TextAlign.left,color: AppColors.blackColor,),
                   ),
                 );
               },),
               ),
             ],
            ),
          );
        }
      ),
    );
  }
}
