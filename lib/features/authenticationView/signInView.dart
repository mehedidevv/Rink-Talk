import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ring_talk/features/authenticationView/signUpView.dart';
import 'package:ring_talk/features/homeView/view/homeView.dart';

import '../../common/commontWidget/customButton.dart';
import '../../common/commontWidget/customText.dart';
import '../../common/commontWidget/customTextField.dart';
import '../../common/components/customSize.dart';
import '../../core/utils/appColors.dart';
import '../../core/utils/appImages.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF0096FC),
      body: Column(
        children: [
          /// Top  section
          Expanded(
            flex: 4,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(color: Color(0XFF0096FC)),
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
                    color: Color(0XFFFFFFFF),
                    fontFamily:'Inter',
                  ),

                  CustomText(
                    text: 'One app. One seamless connection. ',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: Color(0XFFFFFFFF),
                    fontFamily:'Inter',
                  ),
                ],
              ),
            ),
          ),

          /// Bottom white section
          Expanded(
            flex: 6,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(24),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomText(
                        text: 'Sign in',
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        color: Color(0XFF082438),
                      ),

                      heightBox20,

                      CustomTextField(
                        hintText: 'mehedi@gmail.com',
                        borderColor: Color(0XFFB9C6D6),
                        showObscure: false,
                      ),

                      heightBox14,

                      CustomTextField(
                        hintText: 'Password',
                        borderColor: Color(0XFFB9C6D6),
                        showObscure: true,
                      ),

                      heightBox14,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomText(
                            text: 'Forget password?',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0XFF5E5E5E),
                            underline: true,
                          ),
                        ],
                      ),

                      heightBox20,

                      CustomButtonWidget(
                          btnText: 'Sign in',
                          btnColor: AppColors.mainColor,
                          onTap: () => Get.to(HomeView()),
                          iconWant: false
                      ),

                      heightBox20,

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          CustomText(
                            text: 'Don’t have any account?',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0XFF5E5E5E),
                          ),

                          widthBox5,
                          GestureDetector(
                            onTap: () => Get.to(SignUpView()),
                            child: CustomText(
                              text: 'Signup Now',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF0096FC),
                            ),
                          ),
                        ],
                      )

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