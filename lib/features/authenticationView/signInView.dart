import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ring_talk/features/authenticationView/signUpView.dart';
import 'package:ring_talk/features/homeView/view/homeView.dart';

import '../../common/commontWidget/customButton.dart';
import '../../common/commontWidget/customText.dart';
import '../../common/commontWidget/customTextField.dart';
import '../../common/components/customSize.dart';
import '../../core/utils/appColors.dart';
import '../../core/utils/appImages.dart';
import 'controller/authController.dart';

class SignInView extends StatelessWidget {
  SignInView({super.key});

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
                        text: 'Sign in',
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0XFF082438),
                      ),

                      heightBox20,

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

                      heightBox14,

                      /// Forgot password (UI only for now)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // TODO: Firebase reset password
                            },
                            child: CustomText(
                              text: 'Forget password?',
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: const Color(0XFF5E5E5E),
                              underline: true,
                            ),
                          ),
                        ],
                      ),

                      heightBox20,

                      /// Sign In Button
                      Obx(
                            () => CustomButtonWidget(
                          btnText: authController.isLoading.value
                              ? 'Please wait...'
                              : 'Sign in',
                          btnColor: AppColors.mainColor,
                          onTap: () async {
                            await authController.signIn();
                            if (authController.isLoggedIn) {
                              Get.offAll(() => HomeView());
                            }
                          },
                          iconWant: false,
                        ),
                      ),

                      heightBox20,

                      /// Sign Up Redirect
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: 'Don’t have any account?',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: const Color(0XFF5E5E5E),
                          ),
                          widthBox5,
                          GestureDetector(
                            onTap: () => Get.to(() => SignUpView()),
                            child: CustomText(
                              text: 'Signup Now',
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
