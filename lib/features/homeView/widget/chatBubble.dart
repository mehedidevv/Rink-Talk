import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/utils/appColors.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final String time;
  final List<String>? imageUrls;
  final bool isMe;

  const ChatBubble({
    Key? key,
    required this.message,
    required this.time,
    this.imageUrls,
    required this.isMe,
  }) : super(key: key);

  Widget _buildImage(BuildContext context, String pathOrUrl) {
    final bool isNetwork = pathOrUrl.startsWith("http");

    return GestureDetector(
      onTap: () {
       ///
      },
      child: Hero(
        tag: pathOrUrl,
        child: isNetwork
            ? Image.network(
          pathOrUrl,
          width: 200.w,
          height: 200.h,
          fit: BoxFit.cover,
        )
            : Image.file(
          File(pathOrUrl),
          width: 200.w,
          height: 200.h,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool onlyImages = (message.isEmpty && imageUrls != null && imageUrls!.isNotEmpty);

    final Color bubbleColor = onlyImages
        ? Colors.transparent
        : isMe
        ? AppColors.mainColor
        : Colors.grey.withOpacity(0.4);

    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
            decoration: BoxDecoration(
              color: bubbleColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: isMe ? Radius.circular(12) : Radius.circular(0),
                bottomRight: isMe ? Radius.circular(0) : Radius.circular(12),
              ),
            ),
            child: Column(
              crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                if (imageUrls != null && imageUrls!.isNotEmpty)
                  ...imageUrls!.map(
                        (url) => Padding(
                      padding: EdgeInsets.only(bottom: 5.h),
                      child: _buildImage(context, url),
                    ),
                  ),

                if (message.isNotEmpty)
                  Text(
                    message,
                    style: TextStyle(
                      color: isMe ? Colors.white : Colors.black87,
                      fontSize: 14.sp,
                    ),
                  ),
              ],
            ),
          ),

          // Time
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Text(
              time,
              style: TextStyle(
                fontSize: 12.sp,
                color: Colors.grey.shade400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}