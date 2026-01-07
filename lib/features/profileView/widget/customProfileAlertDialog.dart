import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/commontWidget/customText.dart';
import '../../../common/components/customSize.dart';
import '../../../core/utils/appColors.dart';

class ProfileAlertDialog extends StatelessWidget {
  final String subTitle;
  final VoidCallback onAccept;
  final VoidCallback onDeny;

  const ProfileAlertDialog({
    super.key,
    required this.subTitle,
    required this.onAccept,
    required this.onDeny,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.zero,
      content: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // 🔹 Main Dialog Body
            Container(
              width: 300.w,
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  // 🔹 Logout Icon
                  Container(
                    padding: EdgeInsets.all(14.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0XFF1A1A1A),
                      border: Border.all(
                        color: const Color(0XFF1A1A1A),
                        width: 0.5,
                      ),
                    ),
                    child: const Icon(
                      Icons.logout,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),

                  SizedBox(height: 15.h),

                  // 🔹 Subtitle
                  CustomText(
                    text: subTitle,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: const Color(0XFF676769),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 25.h),

                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: onAccept,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14.r),
                              border: Border.all(
                                width: 0.5,
                                color: AppColors.mainColor,
                              ),
                            ),
                            child:  Center(
                              child: CustomText(
                                text: 'Yes',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0XFF344054),
                              ),
                            ),
                          ),
                        ),
                      ),

                      widthBox10,

                      Expanded(
                        child: GestureDetector(
                          onTap: onDeny,
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Color(0XFF1A1A1A),
                              borderRadius: BorderRadius.circular(14.r),
                              border: Border.all(
                                width: 1,
                                color: AppColors.mainColor,
                              ),
                            ),
                            child:  Center(
                              child: CustomText(
                                text: 'No',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // 🔹 Close Button
            Positioned(
              top: -10,
              right: -10,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: EdgeInsets.all(6.w),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.close,
                    color: Colors.red,
                    size: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
