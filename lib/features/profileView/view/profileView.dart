import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:ring_talk/common/commontWidget/customAppbar.dart';
import 'package:ring_talk/common/components/customSize.dart';
import 'package:ring_talk/features/profileView/view/editProfileView.dart';

import '../../../core/utils/appImages.dart';
import '../../authenticationView/signInView.dart';
import '../widget/customProfileAlertDialog.dart';
import '../widget/profileTileWidget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Profile'),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [

              heightBox20,

              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: const Color(0XFF0096FC),
                  backgroundImage: const NetworkImage(
                    'https://i.pravatar.cc/150?img=3',
                  ),
                ),
              ),

              heightBox30,

              ProfileTileWidget(
                title: "Edit Profile",
                onTap: () => Get.to(EditProfileView()),
              ),

              heightBox20,

              ProfileTileWidget(
                title: "Log Out",
                onTap: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) => ProfileAlertDialog(
                      subTitle: "Are you sure you want to log out?",
                      onAccept: () async{
                        await FirebaseAuth.instance.signOut();
                        Get.offAll(() => SignInView());
                        print("User logged out");
                      },
                      onDeny: () {
                        Navigator.pop(context);
                      },
                    ),
                  );
                },
              ),


              heightBox20,

              ProfileTileWidget(
                title: "Delete Account",
                textColor: Colors.red,
                onTap: () {
                  print('object');
                },
              ),


            ],
          ),
        ),
      ),
    );
  }
}
