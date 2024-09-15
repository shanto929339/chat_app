//
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import 'package:get/get.dart';
//
//
//
// class BottomNavBarSalon extends StatefulWidget{
//   final int currentIndex;
//
//   const BottomNavBarSalon({super.key, required this.currentIndex});
//
//   @override
//   State<BottomNavBarSalon> createState() => _BottomNavBarSalonState();
// }
//
// class _BottomNavBarSalonState extends State<BottomNavBarSalon>{
//
//
//   int bottomNavIndex = 0;
//
//   @override
//   void initState() {
//
//     bottomNavIndex = widget.currentIndex;
//
//     super.initState();
//   }
//   List<Widget Function()> screens=[
//
//      () =>  SalonHomeScreen(),
//     ()=>  SalonInventory(),
//     ()=>  SalonBookingHistory(),
//     ()=>  SalonInboxScreen(),
//     ()=>  SalonProfile(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//
//     return   CurvedNavigationBar(
//
//       backgroundColor: AppColors.homeButtonColor,
//
//       buttonBackgroundColor: AppColors.homeButtonColor,
//       index: widget.currentIndex,
//       // height: 70.h,
//       // height: 70.h,
//       //animationCurve: Curves.easeInCubic,
//       //animationDuration: const Duration(microseconds:200),
//       items: <Widget>[
//
//         SvgPicture.asset(
//           AppIcons.homeSelected,
//           height: 18.w,
//           width: 22.h,
//           color: bottomNavIndex != 0 ? Colors.grey : Colors.white,
//         ),
//
//         SvgPicture.asset(
//           AppIcons.salonInventory,
//           height: 18.w,
//           width: 22.h,
//           colorFilter: ColorFilter.mode(bottomNavIndex != 1 ? Colors.grey : Colors.white,BlendMode.srcIn)
//         ),
//
//         SvgPicture.asset(
//           AppIcons.apointmentSelected,
//           height: 18.w,
//           width: 22.h,
//           color: bottomNavIndex != 2 ? Colors.grey : Colors.white,
//         ),
//         SvgPicture.asset(
//           AppIcons.messageSelected,
//           height: 18.w,
//           width: 22.h,
//           color: bottomNavIndex != 3 ? Colors.grey : Colors.white,
//         ),
//         SvgPicture.asset(
//           AppIcons.salonProfile,
//           height: 18.w,
//           width: 22.h,
//           color: bottomNavIndex != 4? Colors.grey : Colors.white,
//         ),
//       ],
//       onTap: (index) {
//         setState(() {
//           bottomNavIndex = index;
//         });
//         Get.offAll(screens[index],
//              transition: Transition.fadeIn,
//             duration: const Duration(milliseconds:400));
//
//       },
//     );
//   }
// }
