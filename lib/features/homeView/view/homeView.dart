import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ring_talk/common/commontWidget/customText.dart';
import 'package:ring_talk/common/components/customSize.dart';
import 'package:ring_talk/features/homeView/view/messageScreen.dart';
import '../widget/userCardWidget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  /// Dummy user data
  final List<Map<String, String>> dummyUsers = const [
    {
      "name": "John Doe",
      "email": "john@gmail.com",
      "time": "Yesterday",
      "imageUrl": "https://i.pravatar.cc/150?img=3",
    },
    {
      "name": "Jane Smith",
      "email": "jane@gmail.com",
      "time": "2 hours ago",
      "imageUrl": "https://i.pravatar.cc/150?img=5",
    },
    {
      "name": "Michael Lee",
      "email": "michael@gmail.com",
      "time": "10:45 AM",
      "imageUrl": "https://i.pravatar.cc/150?img=8",
    },
    {
      "name": "Sarah Connor",
      "email": "sarah@gmail.com",
      "time": "Yesterday",
      "imageUrl": "https://i.pravatar.cc/150?img=12",
    },
    {
      "name": "Robert Brown",
      "email": "robert@gmail.com",
      "time": "5 minutes ago",
      "imageUrl": "https://i.pravatar.cc/150?img=15",
    },
    {
      "name": "John Doe",
      "email": "john@gmail.com",
      "time": "Yesterday",
      "imageUrl": "https://i.pravatar.cc/150?img=3",
    },
    {
      "name": "Jane Smith",
      "email": "jane@gmail.com",
      "time": "2 hours ago",
      "imageUrl": "https://i.pravatar.cc/150?img=5",
    },
    {
      "name": "Michael Lee",
      "email": "michael@gmail.com",
      "time": "10:45 AM",
      "imageUrl": "https://i.pravatar.cc/150?img=8",
    },
    {
      "name": "Sarah Connor",
      "email": "sarah@gmail.com",
      "time": "Yesterday",
      "imageUrl": "https://i.pravatar.cc/150?img=12",
    },
    {
      "name": "Robert Brown",
      "email": "robert@gmail.com",
      "time": "5 minutes ago",
      "imageUrl": "https://i.pravatar.cc/150?img=15",
    },
    {
      "name": "John Doe",
      "email": "john@gmail.com",
      "time": "Yesterday",
      "imageUrl": "https://i.pravatar.cc/150?img=3",
    },
    {
      "name": "Jane Smith",
      "email": "jane@gmail.com",
      "time": "2 hours ago",
      "imageUrl": "https://i.pravatar.cc/150?img=5",
    },
    {
      "name": "Michael Lee",
      "email": "michael@gmail.com",
      "time": "10:45 AM",
      "imageUrl": "https://i.pravatar.cc/150?img=8",
    },
    {
      "name": "Sarah Connor",
      "email": "sarah@gmail.com",
      "time": "Yesterday",
      "imageUrl": "https://i.pravatar.cc/150?img=12",
    },
    {
      "name": "Robert Brown",
      "email": "robert@gmail.com",
      "time": "5 minutes ago",
      "imageUrl": "https://i.pravatar.cc/150?img=15",
    },
    {
      "name": "John Doe",
      "email": "john@gmail.com",
      "time": "Yesterday",
      "imageUrl": "https://i.pravatar.cc/150?img=3",
    },
    {
      "name": "Jane Smith",
      "email": "jane@gmail.com",
      "time": "2 hours ago",
      "imageUrl": "https://i.pravatar.cc/150?img=5",
    },
    {
      "name": "Michael Lee",
      "email": "michael@gmail.com",
      "time": "10:45 AM",
      "imageUrl": "https://i.pravatar.cc/150?img=8",
    },
    {
      "name": "Sarah Connor",
      "email": "sarah@gmail.com",
      "time": "Yesterday",
      "imageUrl": "https://i.pravatar.cc/150?img=12",
    },
    {
      "name": "Robert Brown",
      "email": "robert@gmail.com",
      "time": "5 minutes ago",
      "imageUrl": "https://i.pravatar.cc/150?img=15",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header: User List + Profile Image
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: CustomText(
                        text: 'User List',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: const Color(0XFF082438),
                      ),
                    ),
                  ),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: const Color(0XFF0096FC),
                    backgroundImage: const NetworkImage(
                      'https://i.pravatar.cc/150?img=3',
                    ),
                  ),
                ],
              ),
            ),


            heightBox14,
            /// Divider
            const Divider(),

            /// User List
            Expanded(
              child: ListView.builder(
                itemCount: dummyUsers.length,
                itemBuilder: (context, index) {
                  final user = dummyUsers[index];
                  return UserCard(
                    name: user['name'] ?? '',
                    email: user['email'] ?? '',
                    time: user['time'] ?? '',
                    imageUrl: user['imageUrl'] ?? '',
                    onTap: ()=>Get.to(MessageView()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
