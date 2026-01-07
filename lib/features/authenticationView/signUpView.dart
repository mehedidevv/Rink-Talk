import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ring_talk/features/authenticationView/signInView.dart';

import '../../common/commontWidget/customButton.dart';
import '../../common/commontWidget/customText.dart';
import '../../common/commontWidget/customTextField.dart';
import '../../common/components/customSize.dart';
import '../../core/utils/appColors.dart';
import '../../core/utils/appImages.dart';
import 'controller/authController.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF0096FC),
      body: Column(
        children: [
          /// 🔹 Top Section (UNCHANGED)
          Expanded(
            flex: 4,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(color: Color(0XFF0096FC)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage(AppImages.logo),
                  ),
                  heightBox14,
                  CustomText(
                    text: 'Ring Talk ',
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w600,
                    color: const Color(0XFFFFFFFF),
                    fontFamily: 'Inter',
                  ),
                  CustomText(
                    text: 'One app. One seamless connection. ',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0XFFFFFFFF),
                    fontFamily: 'Inter',
                  ),
                ],
              ),
            ),
          ),

          /// 🔹 Bottom Section
          Expanded(
            flex: 6,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomText(
                        text: 'Sign Up',
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0XFF082438),
                      ),

                      heightBox20,

                      /// Full Name
                      CustomTextField(
                        hintText: 'Full name',
                        borderColor: const Color(0XFFB9C6D6),
                        showObscure: false,
                        controller: authController.nameController,
                      ),

                      heightBox14,

                      /// Email
                      CustomTextField(
                        hintText: 'mehedi@gmail.com',
                        borderColor: const Color(0XFFB9C6D6),
                        showObscure: false,
                        controller: authController.emailController,
                      ),

                      heightBox14,

                      /// Password
                      CustomTextField(
                        hintText: 'Password',
                        borderColor: const Color(0XFFB9C6D6),
                        showObscure: true,
                        controller: authController.passwordController,
                      ),

                      heightBox20,

                      /// Sign Up Button
                      Obx(
                            () => CustomButtonWidget(
                          btnText: authController.isLoading.value
                              ? 'Please wait...'
                              : 'Sign up',
                          btnColor: AppColors.mainColor,
                          onTap: () {
                            authController.signUp();
                          },
                          iconWant: false,
                        ),
                      ),

                      heightBox20,

                      /// Sign In Redirect
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: 'Already have any account?',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0XFF5E5E5E),
                          ),
                          widthBox5,
                          GestureDetector(
                            onTap: () => Get.to(() => SignInView()),
                            child: CustomText(
                              text: 'Sign in',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF0096FC),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
