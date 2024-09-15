//
// import 'package:firabse_realtime/utils/AppColors/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:nail_salon/helper/network_img/network_img.dart';
// import 'package:nail_salon/utils/AppColors/app_colors.dart';
// import 'package:nail_salon/utils/app_strings/app_strings.dart';
// import 'package:nail_salon/view/widgets/custom_text/custom_text.dart';
//
// class CustomCard extends StatelessWidget {
//   final String image;
//   final String title;
//   final String location;
//   final String? rating;
//   final bool showButton;
//   final bool showFavoriteIcon;
//   final VoidCallback? onTap;
//   final VoidCallback? onClick;
//   final IconData? iconData;
//   final bool? showFav;
//
//   const CustomCard({
//     super.key,
//     required this.image,
//     required this.title,
//     required this.location,
//      this.rating,  this.showButton=false,  this.onTap,  this.showFavoriteIcon=false, this.iconData, this.onClick,
//     this.showFav,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(16.r),
//       padding: EdgeInsets.all(8.r),
//       decoration: BoxDecoration(
//        color: AppColors.notificationContainerColor,
//         borderRadius: BorderRadius.circular(15.r),
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         //mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           CustomNetworkImage(
//             borderRadius: BorderRadius.circular(8.r),
//             height: 82.r,
//             width: 72.r,
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
//                     CustomText(
//                       textAlign: TextAlign.start,
//                       maxLines: 2,
//                       text: title,
//                       fontSize: 16,
//                       color: Colors.black,
//                       fontWeight: FontWeight.w400,
//                     ),
//                     const Spacer(),
//
//                  showFav==true?GestureDetector(
//                     onTap: onClick,
//                     child: showFavoriteIcon==true?const Icon(Icons.favorite,color: AppColors.homeButtonColor,):
//                     Icon(Icons.favorite_border,color: AppColors.homeButtonColor,)
//                     ):
//                  SizedBox(height: 1.h,),
//
//                   ],
//                 ),
//                 SizedBox(height: 8.h), // Add space between title and location
//                 CustomText(
//                   textAlign: TextAlign.start,
//                   maxLines: 2,
//                   text: location,
//                   fontSize: 12,
//                   color: AppColors.titleColor,
//                   fontWeight: FontWeight.w400,
//                 ),
//                 SizedBox(height: 8.h), // Add space between location and rating
//                 Row(
//                   children: [
//                     Icon(
//                       iconData,
//                       color: AppColors.ratingsColor,
//                       size: 17.r,
//                     ),
//                     SizedBox(width: 4.w),
//                     CustomText(
//                       text:rating.toString(),
//                       fontSize: 13,
//                       color: AppColors.ratingsColor,
//                       fontWeight: FontWeight.w400,
//                     ),
//                     const Spacer(),
//                     if(showButton)
//                     GestureDetector(
//                       onTap: onTap,
//                       child: Container(
//                         padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
//                         decoration: BoxDecoration(
//                           color: AppColors.homeButtonColor,
//                           borderRadius: BorderRadius.circular(10.r),
//                         ),
//                         child: const CustomText(
//                           text: AppStrings.seeDetails,
//                           fontSize: 12,
//                           color: Colors.white,
//                         ),
//                       ),
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
// }
