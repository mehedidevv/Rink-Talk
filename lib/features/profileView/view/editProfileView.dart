import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:image_picker/image_picker.dart';

import '../../../common/commontWidget/customAppbar.dart';
import '../../../common/commontWidget/customButton.dart';
import '../../../common/commontWidget/customText.dart';
import '../../../common/commontWidget/customTextField.dart';
import '../../../common/components/customSize.dart';
import '../../../core/utils/appColors.dart';
import '../controller/editProfileController.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({super.key});

  @override
  _EditProfileViewState createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {

  final EditProfileController editProfileController = Get.put(EditProfileController());
  final TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    editProfileController.loadUserData();
    nameController.text = editProfileController.name.value;
  }

  @override
  Widget build(BuildContext context) {
    double avatarSize = 120.w;

    return Scaffold(
      appBar: CustomAppBar(title: 'Edit Profile'),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),

                /// Profile Image
                Center(
                  child: Obx(() => GestureDetector(
                    onTap: editProfileController.pickImage,
                    child: Container(
                      height: avatarSize,
                      width: avatarSize,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Color(0xFF1A1A1A).withOpacity(0.67),
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.all(2.w),
                          height: avatarSize - 16,
                          width: avatarSize - 16,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0XFFEAE9E9),
                          ),
                          child: ClipOval(
                            child: editProfileController.imageFile.value != null
                                ? Image.file(
                              editProfileController.imageFile.value!,
                              fit: BoxFit.cover,
                            )
                                : (editProfileController.currentUser?.photoURL != null
                                ? Image.network(
                              editProfileController.currentUser!.photoURL!,
                              fit: BoxFit.cover,
                            )
                                : Icon(
                              Icons.camera_alt,
                              size: 50,
                              color: Colors.grey,
                            )),
                          ),
                        ),
                      ),
                    ),
                  )),
                ),

                heightBox20,

                CustomText(
                  text: 'Name',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0XFF4F4F4F),
                ),
                heightBox10,

                CustomTextField(
                  hintText: 'Full Name',
                  showObscure: false,
                  controller: nameController,
                  onChanged: (value) => editProfileController.name.value = value,
                ),
                heightBox20,

                CustomText(
                  text: 'Email',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Color(0XFF4F4F4F),
                ),
                heightBox10,

                CustomTextField(
                  hintText: editProfileController.currentUser?.email ?? '',
                  showObscure: false,
                  readOnly: true,
                ),

                heightBox40,

                Obx(() => CustomButtonWidget(
                  btnText: editProfileController.isLoading.value
                      ? 'Updating...'
                      : 'Update Profile',
                  onTap: editProfileController.isLoading.value
                      ? null
                      : editProfileController.updateProfile,
                  iconWant: false,
                )),

                heightBox20,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
