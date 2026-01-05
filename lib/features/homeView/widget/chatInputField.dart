import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/utils/appColors.dart';

class ChatInputField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;
  final VoidCallback onGalleryTap;

  const ChatInputField({
    Key? key,
    required this.controller,
    required this.onSend,
    required this.onGalleryTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.h),
      child: Row(
        children: [
          GestureDetector(
            onTap: onGalleryTap,
            child: CircleAvatar(
              radius: 22.r,
              backgroundColor: AppColors.mainColor,
              child: Icon(Icons.photo_library, color: Colors.white),
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller,
                      textInputAction: TextInputAction.send,
                      onSubmitted: (_) {
                        onSend();
                      },
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Type a message",
                        hintStyle: GoogleFonts.poppins(color: Colors.white70),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 0, right: 40.w),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: onSend,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.send, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}