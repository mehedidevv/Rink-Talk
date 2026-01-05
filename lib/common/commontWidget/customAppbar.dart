import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import '../../core/utils/appColors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double? fontSize;
  final VoidCallback? onTap;
  final bool centerTitle;
  final Color? backgroundColor;
  final bool forceMaterialTransparency;
  final bool? automaticallyImplyLeading;
  final List<Widget>? actions;
  final Widget? leading;

  /// 👇 NEW (size control)
  final double backButtonSize;
  final double iconSize;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.fontSize,
    this.centerTitle = true,
    this.backgroundColor = Colors.transparent,
    this.forceMaterialTransparency = true,
    this.actions,
    this.leading,
    this.automaticallyImplyLeading,
    this.onTap,

    /// 👇 defaults (old behavior same)
    this.backButtonSize = 32,
    this.iconSize = 16,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      automaticallyImplyLeading: automaticallyImplyLeading ?? true,
      backgroundColor: backgroundColor,

      /// 👇 IMPORTANT for size control
      leadingWidth: backButtonSize.w + 16.w,

      title: Text(
        title,
        style: GoogleFonts.lato(
          fontSize: fontSize ?? 16.h,
          fontWeight: FontWeight.w500,
        ),
      ),
      centerTitle: centerTitle,
      actions: actions,

      leading: leading ??
          Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: GestureDetector(
              onTap: onTap ??
                      () {
                    if (Get.isSnackbarOpen) Get.closeCurrentSnackbar();
                    if (Navigator.canPop(context)) {
                      Navigator.pop(context);
                    } else {
                      if (kDebugMode) print("No routes to pop");
                    }
                  },
              child: Container(
                height: backButtonSize.h,
                width: backButtonSize.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color:  Colors.transparent,
                  ),
                  color: const Color(0XFFF3F3F5),
                ),
                alignment: Alignment.center,
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: const Color(0XFF232323),
                  size: iconSize.h,
                ),
              ),
            ),
          ),

      elevation: forceMaterialTransparency ? 0 : null,
    );
  }
}