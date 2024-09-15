// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class CustomFeaturedSalons extends StatelessWidget {
//   final String image;
//   final String category;
//   final String location;
//   final bool isFavorite;
//   final double totalRatting;
//   final VoidCallback? onTap;
//   final VoidCallback? addFavorite;
//
//   const CustomFeaturedSalons({
//     super.key,
//     required this.image,
//     required this.totalRatting,
//     required this.category,
//     required this.location,
//      this.isFavorite=false,
//      this.onTap,
//      this.addFavorite,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 159.h,
//       width: 189.w,
//       padding: EdgeInsets.all(10.r),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(15.r),
//         color: Colors.white,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           CustomNetworkImage(
//             borderRadius: BorderRadius.circular(13.r),
//             height: 94.h,
//             width: 165.w,
//             imageUrl: image,
//           ),
//           SizedBox(
//             height: 12.h,
//           ),
//           CustomText(
//             textAlign: TextAlign.start,
//             maxLines: 2,
//             text: category,
//             fontSize: 12.sp,
//             color: Colors.black,
//             fontWeight: FontWeight.w400,
//           ),
//           const Spacer(),
//           Row(
//             children: [
//               Expanded(
//                 child: CustomText(
//                   textAlign: TextAlign.start,
//                   maxLines: 1,
//                   text: location,
//                   fontSize: 8.sp,
//                   color: Colors.black,
//                 ),
//               ),
//               GestureDetector(
//                 onTap: addFavorite,
//                 child: Icon(
//                   isFavorite==true? Icons.favorite : Icons.favorite_border,
//                   color: AppColors.homeButtonColor,
//                   size:16,
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 8.h,
//           ),
//           Row(
//             children: [
//               Container(
//                 width: 100.w,
//                 decoration: BoxDecoration(
//                   color: AppColors.homeButtonColor,
//                   borderRadius: BorderRadius.circular(10.r),
//                 ),
//                 child: GestureDetector(
//                   onTap: onTap,
//                   child: CustomText(
//                     text: AppStrings.seeDetails,
//                     fontSize: 12.sp,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//               const Spacer(),
//               Row(
//                 children: [
//                   Icon(
//                     Icons.star,
//                     color: AppColors.ratingsColor,
//                     size: 17.r,
//                   ),
//                   CustomText(
//                     text:totalRatting.toStringAsFixed(2),
//                     fontSize: 13.sp,
//                     color: AppColors.ratingsColor,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
