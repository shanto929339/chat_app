
import 'package:firabse_realtime/Core/AppRoute/approute.dart';
import 'package:firabse_realtime/View/Screen/Auth_screen/Controller/auth_controller.dart';
import 'package:firabse_realtime/View/widgets/custom_button/custom_button.dart';
import 'package:firabse_realtime/View/widgets/custom_text/custom_text.dart';
import 'package:firabse_realtime/View/widgets/custom_text_field/custom_text_field.dart';
import 'package:firabse_realtime/utils/AppColors/app_colors.dart';
import 'package:firabse_realtime/utils/app_strings/app_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  final User? user = FirebaseAuth.instance.currentUser;



  // TextEditingController signInEmailController=TextEditingController();
  // TextEditingController signInPassController=TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_){
      if(user!=null){
        Get.offAllNamed(AppRoute.homeScreen);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          body: GetBuilder<AuthController>(
                 builder: (controller) {
                   return Padding(
                      padding: EdgeInsets.symmetric(vertical: 64.h, horizontal: 22.w),
                      child: SingleChildScrollView(
                        child: Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                top: 40.h,
                                text: AppStrings.welcome,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.authButtonColor,
                              ),
                              Row(
                                children: [
                                  CustomText(
                                    text: AppStrings.loginTOStartWith,
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                    right: 10.w,
                                  ),
                                  // CustomImage(
                                  //   imageSrc: AppImages.nifi,
                                  //   imageType: ImageType.png,
                                  //   size: 35.sp,
                                  // )
                                ],
                              ),
                              ///======================Email========================
                              CustomText(
                                top: 60.h,
                                text: AppStrings.email,
                                color: AppColors.normalBlu,
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                                bottom: 5.h,
                              ),
                              CustomTextField(
                                textEditingController:controller.emailController ,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return AppStrings.fieldCantBeEmpty;
                                  } else if (!AppStrings.emailRegexp
                                      .hasMatch(
                                      controller.emailController.text
                                  )){
                                    return AppStrings.enterValidEmail;
                                  } else {
                                    return null;
                                  }
                                },
                                fillColor: AppColors.white,
                                focusBorderColor: AppColors.white,
                                borderRadius: 10,
                              ),
                              ///=========================Password============================
                              CustomText(
                                top: 18.h,
                                text: AppStrings.password,
                                color: AppColors.normalBlu,
                                fontWeight: FontWeight.w400,
                                fontSize: 14.sp,
                                bottom: 5.h,
                              ),
                              CustomTextField(
                                textEditingController: controller.passwordController,
                                validator: (value) {
                                  if (value == null || value.isEmpty){
                                    return AppStrings.fieldCantBeEmpty;
                                  }  else {
                                    return null;
                                  }
                                },
                                fillColor: AppColors.white,
                                focusBorderColor: AppColors.white,
                                borderRadius: 10,
                                isPassword: true,
                              ),
                              ///==================Forgot Password button================
                              Row(
                                children: [
                                  const SizedBox(),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                    },
                                    child: CustomText(
                                      textAlign: TextAlign.end,
                                      top: 18.h,
                                      text: AppStrings.forgotPassword,
                                      color: AppColors.authButtonColor,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                ],
                              ),

                              ///===============================Sign In button=====================

                              SizedBox(
                                height: 40.h,
                              ),

                              //controller.signInLoading==true?CustomLoader():

                              CustomButton(
                                onTap:(){
                                  if (formKey.currentState!.validate()){
                                    controller.signIn();
                                  }
                                },
                                title: AppStrings.signIn,
                                fillColor: AppColors.authButtonColor,
                                textColor: AppColors.white,
                              ),

                              SizedBox(
                                height: 24.h,
                              ),

                              Center(child: CustomText(text: 'or',bottom: 15.h,)),

                              SizedBox(
                                height: 24.h,
                              ),
                              ///============================Register===================
                              Center(
                                child: RichText(
                                  maxLines: 2,
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: AppStrings.dontHaveAnAccount,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                      TextSpan(
                                        text: AppStrings.register,
                                        style: TextStyle(
                                          color: AppColors.authButtonColor,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                          Get.toNamed(AppRoute.signUpScreen);
                                          },
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                 }
               )
    );
  }
}
