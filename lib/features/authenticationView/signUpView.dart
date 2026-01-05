
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:ring_talk/features/authenticationView/signInView.dart';

import '../../common/commontWidget/customButton.dart';
import '../../common/commontWidget/customText.dart';
import '../../common/commontWidget/customTextField.dart';
import '../../common/components/customSize.dart';
import '../../core/utils/appColors.dart';
import '../../core/utils/appImages.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

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
                        text: 'Sign Up',
                        fontSize: 24.sp,
                        fontWeight: FontWeight.w700,
                        color: Color(0XFF082438),
                      ),

                      heightBox20,

                      CustomTextField(
                        hintText: 'Full name',
                        borderColor: Color(0XFFB9C6D6),
                        showObscure: false,
                      ),

                      heightBox14,

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
                      

                      heightBox20,

                      CustomButtonWidget(
                          btnText: 'Sign up',
                          btnColor: AppColors.mainColor,
                          onTap: (){

                          },
                          iconWant: false
                      ),

                      heightBox20,

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          CustomText(
                            text: 'Already have any account?',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: Color(0XFF5E5E5E),
                          ),

                          widthBox5,
                          GestureDetector(
                            onTap: () => Get.to(SignInView()),
                            child: CustomText(
                              text: 'Sign in',
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
