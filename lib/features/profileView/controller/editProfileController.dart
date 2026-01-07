import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final ImagePicker _picker = ImagePicker();

  var isLoading = false.obs;
  var name = ''.obs;
  var imageFile = Rxn<File>();

  /// Current user
  User? get currentUser => _auth.currentUser;

  /// Initialize current data
  void loadUserData() {
    final user = currentUser;
    if (user != null) {
      name.value = user.displayName ?? '';
    }
  }

  /// Pick image from gallery
  Future<void> pickImage() async {
    try {
      final XFile? pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        maxHeight: 800,
        maxWidth: 800,
        imageQuality: 80,
      );
      if (pickedFile != null) {
        imageFile.value = File(pickedFile.path);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick image: $e');
    }
  }

  /// Update profile
  Future<void> updateProfile() async {
    final user = currentUser;
    if (user == null) return;

    try {
      isLoading.value = true;

      String? photoURL;

      if (imageFile.value != null) {
        final ref = FirebaseStorage.instance
            .ref()
            .child('profile_images')
            .child('${user.uid}.jpg');

        await ref.putFile(imageFile.value!);
        photoURL = await ref.getDownloadURL();
      }

      /// Update user display name and photo
      await user.updateDisplayName(name.value);
      if (photoURL != null) await user.updatePhotoURL(photoURL);

      await user.reload();
      Get.snackbar('Success', 'Profile updated successfully');

    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
