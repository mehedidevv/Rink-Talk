import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import '../../../common/commontWidget/customText.dart';
import '../../../common/components/customSize.dart';
import '../../../core/utils/appColors.dart';

class ProfileTileWidget extends StatelessWidget {
  final String title;
  final Callback? onTap;

  /// 👉 Added optional text color
  final Color? textColor;

  const ProfileTileWidget({
    super.key,
    required this.title,
    this.onTap,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // Container(
              //   height: 28.h,
              //   width: 28.w,
              //   decoration: BoxDecoration(
              //     color: const Color(0xFFE8E8E8),
              //     shape: BoxShape.circle,
              //   ),
              //   child: Center(
              //     child: Image.asset(
              //       imagePath,
              //       height: 12.h,
              //       width: 12.w,
              //     ),
              //   ),
              // ),
              // widthBox14,

              GestureDetector(
                onTap: onTap,
                child: CustomText(
                  text: title,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Lato',

                  /// 👉 Use user-given color OR default
                  color: textColor ?? const Color(0XFF121212),
                ),
              ),
            ],
          ),
          Icon(
            Icons.arrow_forward_ios_rounded,
            size: 15.h,
            color: const Color(0XFF99A1AF),
          )
        ],
      ),
    );
  }
}