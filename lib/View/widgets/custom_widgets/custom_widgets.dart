// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
//
// import '../custom_image/custom_image.dart';
// import '../custom_text/custom_text.dart';
//
// class CustomWidgets {
//   ///=============================Custom Menu====================
//   Widget customMenu(
//           {required String image,
//           required String title,
//           required VoidCallback onTap}) =>
//       Column(
//         children: [
//           GestureDetector(
//             onTap: onTap,
//             child: Row(
//               children: [
//                 CustomImage(
//                   imageType: ImageType.svg,
//                   imageSrc: image,
//                   imageColor: AppColors.homeButtonColor,
//                 ),
//                 CustomText(
//                   color: Colors.black,
//                   left: 16.w,
//                   text: title,
//                   fontSize: 16.w,
//                   fontWeight: FontWeight.w400,
//                 ),
//                 const Spacer(),
//                 const Icon(Icons.arrow_forward_ios_rounded),
//               ],
//             ),
//           ),
//           const Divider(
//             color: AppColors.dividerColor,
//           ),
//         ],
//       );
//
//   ///=============================Custom Profile=========================
//   Widget customProfile({
//     required String image,
//     required String title,
//     required String lebel,
//   }) =>
//       Padding(
//         padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 22.h),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CustomText(
//               text: lebel,
//               fontWeight: FontWeight.w400,
//               fontSize: 16.sp,
//               color: AppColors.labelColor,
//             ),
//             Card(
//               color: AppColors.profileContainerColor,
//               child: Padding(
//                 padding: EdgeInsets.all(15.h),
//                 child: Row(
//                   children: [
//                     CustomImage(
//                       imageType: ImageType.svg,
//                       imageSrc: image,
//                       imageColor: AppColors.homeButtonColor,
//                     ),
//                     Expanded(
//                       child: CustomText(
//                         textAlign: TextAlign.start,
//                         color: Colors.black,
//                         left: 8.w,
//                         text: title,
//                         fontSize:14,
//                         // maxLines: 2,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );
//
//   ///=============================Edit custom  Profile=========================
//   Widget customEditProfile({
//     required String title,
//     required String lebel,
//     required TextEditingController controller,
//   }) =>
//       Padding(
//         padding: EdgeInsets.symmetric(vertical: 10.h),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             CustomText(
//               text: lebel,
//               fontWeight: FontWeight.w400,
//               fontSize: 16.sp,
//               color: AppColors.labelColor,
//               bottom: 10,
//             ),
//              CustomTextField(
//               textEditingController:controller,
//               fieldBorderColor: Colors.black,
//               fillColor: AppColors.profileContainerColor,
//               focusBorderColor: Colors.black,
//             )
//           ],
//         ),
//       );
//
//   ///====================================Custom Row=============================
//
//   Widget customRow(
//       {required String startTitle,
//       required String endTitle,
//       required VoidCallback onTap}) {
//     return Row(
//       children: [
//         CustomText(
//           text: startTitle,
//           fontSize: 17.sp,
//           fontWeight: FontWeight.w500,
//           color: Colors.black,
//         ),
//         const Spacer(),
//         InkWell(
//           onTap: onTap,
//           child: CustomText(
//             text: endTitle,
//             fontSize: 14.sp,
//             fontWeight: FontWeight.w400,
//             color: AppColors.homeButtonColor,
//           ),
//         ),
//       ],
//     );
//   }
//
//   ///========================Custom Image text=======================
//
//   Widget customImageText({
//     required String image,
//     required String category,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         CustomNetworkImage(
//           borderRadius: BorderRadius.circular(13),
//           height: 72.h,
//           width: 72.w,
//           imageUrl:image,
//         ),
//         SizedBox(
//           height: 12.h,
//         ),
//         CustomText(
//             textAlign: TextAlign.start,
//             maxLines: 5,
//             text: category,
//             fontSize: 12.sp,
//             color: AppColors.labelColor,
//             fontWeight: FontWeight.w400),
//       ],
//     );
//   }
//
//   ///=============================Custom book mark============================
//   Widget customBookMark({
//     required String image,
//     required String title,
//     required String location,
//     required String rating,
//     required void Function()? onClick,
//
//   }) {
//     return Container(
//       margin: EdgeInsets.all(16.r),
//       padding: EdgeInsets.all(12.r),
//       decoration: BoxDecoration(
//         color: AppColors.notificationContainerColor,
//         borderRadius: BorderRadius.circular(15.r),
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           CustomNetworkImage(
//             borderRadius:BorderRadius.circular(8.r),
//             height: 52.r,
//             width: 52.r,
//             imageUrl: image,
//           ),
//           SizedBox(
//             width: 16.w,
//           ),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     Expanded(
//                       child: CustomText(
//                         textAlign: TextAlign.start,
//                         bottom: 8.r,
//                         maxLines: 2,
//                         text: title,
//                         fontSize: 16.sp,
//                         color: Colors.black,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: onClick,
//                       child: Icon(
//                         Icons.favorite,
//                         color: AppColors.homeButtonColor,
//                         size: 20.r,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 8.h), // Add space between title and location
//                 CustomText(
//                   maxLines: 2,
//                   text: location,
//                   fontSize: 12.sp,
//                   color: AppColors.titleColor,
//                   fontWeight: FontWeight.w400,
//                 ),
//                 SizedBox(height: 8.h), // Add space between location and rating
//                 Row(
//                   children: [
//                     Icon(
//                       Icons.star,
//                       color: AppColors.ratingsColor,
//                       size: 17.r,
//                     ),
//                     SizedBox(width: 4.w),
//                     CustomText(
//                       text: rating,
//                       fontSize: 13.sp,
//                       color: AppColors.ratingsColor,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
// ///===============================Custom Build tab===============================
//   Widget buildTab({
//     required int index,
//     required String label,
//     required HomeController homeController,
//   }) {
//     return GestureDetector(
//       onTap: () {
//         homeController.changeTab(index);
//       },
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 8.w),
//         child: CustomText(
//           textAlign: TextAlign.center,
//           text: label,
//           color: homeController.selectedIndex.value == index
//               ? AppColors.homeButtonColor
//               : AppColors.labelColor,
//           fontSize: 16.sp,
//           fontWeight: FontWeight.w500,
//           decoration: homeController.selectedIndex.value == index
//               ? TextDecoration.underline
//               : TextDecoration.none,
//         ),
//       ),
//     );
//   }///===============================Custom Build tab===============================
//   Widget buildCustomSalonTab({
//     required int index,
//     required String label,
//     required SalonDetailsController salonDetailsController,
//   }) {
//     return GestureDetector(
//       onTap: () {
//         salonDetailsController.changeTab(index);
//       },
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 8.w),
//         child: CustomText(
//           textAlign: TextAlign.center,
//           text: label,
//           color: salonDetailsController.selectedIndex.value == index
//               ? AppColors.homeButtonColor
//               : Colors.black,
//           fontSize: 16.sp,
//           fontWeight: FontWeight.w500,
//           decoration: salonDetailsController.selectedIndex.value == index
//               ? TextDecoration.underline
//               : TextDecoration.none,
//         ),
//       ),
//     );
//   }
//
// ///=====================================Custom Receipt============================
//   Widget customReport({
//     required String title,
//     required String titleName,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           children: [
//             CustomText(
//                 text: title,
//                 fontSize: 15.sp,
//                 color: Colors.black,
//                 fontWeight: FontWeight.w400),
//             const Spacer(),
//             CustomText(
//                 text: titleName,
//                 fontSize: 15.sp,
//                 color: Colors.black,
//                 fontWeight: FontWeight.w500),
//           ],
//         ),
//         SizedBox(
//           height: 13.h,
//         )
//       ],
//     );
//   }
//
//
//
//   Widget customReviewCard({
//     required String image,
//     required String name,
//     required String date,
//     required String comment,
//   }) {
//     return Container(
//       padding: const EdgeInsets.all(10),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15),
//           color: AppColors.notificationContainerColor),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               CustomNetworkImage(
//                   borderRadius: BorderRadius.circular(5),
//                   imageUrl: image,
//                   height: 32.h,
//                   width: 32.w),
//               CustomText(
//                 left: 10,
//                 text: name,
//                 fontWeight: FontWeight.w400,
//                 fontSize: 14.sp,
//                 color: Colors.black,
//               ),
//               const Spacer(),
//               CustomText(
//                 text: date,
//                 fontWeight: FontWeight.w400,
//                 fontSize: 12.sp,
//                 color: AppColors.labelColor,
//               ),
//             ],
//           ),
//           CustomText(
//             top: 15,
//             textAlign: TextAlign.start,
//             maxLines: 10,
//             text: comment,
//             fontWeight: FontWeight.w400,
//             fontSize: 12.sp,
//             color: Colors.black,
//           ),
//         ],
//       ),
//     );
//   }
//
//   ///==============================salon booking part===================
//
//
//   Widget customSalonEditProfile({
//     required void Function()? onClick,
//     required TextInputType keyBoardType,
//     required String title,
//     required TextEditingController textEditingController,
//     bool readOnly=false,
//     String? Function(dynamic value)? validator, String? hint // Add the TextEditingController as a parameter
//   }) {
//     return Padding(
//       padding:  const EdgeInsets.symmetric(horizontal: 10),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           CustomText(
//             bottom: 8,
//             text: title,
//             fontSize: 15.sp,
//             color: Colors.black,
//             fontWeight: FontWeight.w400,
//           ),
//           CustomTextField(
//             keyboardType: keyBoardType,
//             readOnly:readOnly,
//             hintText: hint,
//             validator: validator,
//             onTapClick:onClick!,
//             textEditingController: textEditingController, // Use the provided controller
//             fillColor: Colors.white,
//             fieldBorderColor: AppColors.blackColor,
//           ),
//           SizedBox(
//             height: 10.h,
//           )
//         ],
//       ),
//     );
//   }
//
//   ///==============================salon booking part===================
//
//
//   Widget customSalonProfile({
//     required String title,
//     required String subtitle,
//
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         CustomText(
//           text: title,
//           fontSize: 16.sp,
//           color: Colors.black,
//           fontWeight: FontWeight.w500,
//           bottom: 8.h,
//         ),
//          CustomText(
//            textAlign: TextAlign.start,
//           text: subtitle,
//           fontSize: 14.sp,
//           color: AppColors.labelColor,
//           fontWeight: FontWeight.w400,
//            maxLines: 10,
//         ),
//
//
//       ],
//     );
//   }
//
//
//   ///===============================Custom Build tab===============================
//   Widget customSalonProfileTabBar({
//
//     required int index,
//
//     required String label,
//
//     required SalonProfileController salonProfileController,
//   }) {
//     return GestureDetector(
//       onTap: () {
//         salonProfileController.changeTab(index);
//       },
//       child: Padding(
//
//         padding: EdgeInsets.symmetric(horizontal: 8.w),
//
//         child: CustomText(
//           textAlign: TextAlign.center,
//           text: label,
//           color: salonProfileController.selectedIndex.value == index
//               ? AppColors.homeButtonColor
//               : Colors.black,
//           fontSize: 16.sp,
//           fontWeight: FontWeight.w500,
//           decoration: salonProfileController.selectedIndex.value == index
//               ? TextDecoration.underline
//               : TextDecoration.none,
//         ),
//       ),
//     );
//   }
//
// }
