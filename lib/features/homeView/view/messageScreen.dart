import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ring_talk/common/commontWidget/customAppbar.dart';
import '../widget/chatBubble.dart';
import '../widget/chatInputField.dart';

class MessageView extends StatelessWidget {
   MessageView({super.key});

  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  /// Dummy message list
  final List<Map<String, dynamic>> _messages = [
    {
      'message': 'Hey! How are you?',
      'time': '10:30 AM',
      'isMe': false,
      'imageUrls': null,
    },
    {
      'message': 'I am good! What about you?',
      'time': '10:32 AM',
      'isMe': true,
      'imageUrls': null,
    },
    {
      'message': 'Check out these photos from yesterday',
      'time': '10:35 AM',
      'isMe': false,
      'imageUrls': [
        'https://picsum.photos/400/400?random=1',
      ],
    },
    {
      'message': 'Wow! These look amazing 😍',
      'time': '10:36 AM',
      'isMe': true,
      'imageUrls': null,
    },
    {
      'message': '',
      'time': '10:38 AM',
      'isMe': true,
      'imageUrls': [
        'https://picsum.photos/400/400?random=3',
      ],
    },
    {
      'message': 'Are we still meeting tomorrow?',
      'time': '10:40 AM',
      'isMe': false,
      'imageUrls': null,
    },
    {
      'message': 'Yes, definitely! See you at 5 PM',
      'time': '10:42 AM',
      'isMe': true,
      'imageUrls': null,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Mehedi Hasan'),
      body: Column(
        children: [
          // Messages List
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: EdgeInsets.symmetric(vertical: 10.h),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final msg = _messages[index];
                return ChatBubble(
                  message: msg['message'] ?? '',
                  time: msg['time'] ?? '',
                  imageUrls: msg['imageUrls'],
                  isMe: msg['isMe'] ?? false,
                );
              },
            ),
          ),

          // Input Field
          ChatInputField(
            controller: _messageController,
            onSend: (){},
            onGalleryTap: (){},
          ),
        ],
      ),
    );
  }
}