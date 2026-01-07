import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ring_talk/features/authenticationView/signInView.dart';
import 'authServices.dart';

class AuthController extends GetxController {
  final AuthService _authService = AuthService();

  /// Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  var isLoading = false.obs;
  bool isLoggedIn = false;

  /// SIGN UP
  Future<void> signUp() async {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      Get.snackbar('Error', 'Name , Email & Password required');
      return;
    }

    try {
      isLoading.value = true;

      final user = await _authService.signUpWithEmail(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      if (user != null) {
        Get.snackbar('Success', 'Account created successfully');
        Get.to(SignInView());
      }
    } catch (e) {
      Get.snackbar('Sign Up Failed', e.toString());
    } finally {
      isLoading.value = false;
    }
  }



  Future<void> signIn() async {
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      Get.snackbar('Error', 'Email & Password required');
      return;
    }

    try {
      isLoading.value = true;

      final user = await _authService.signInWithEmail(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      if (user != null) {
        isLoggedIn = true;
        Get.snackbar('Success', 'Login successful');
      }
    } catch (e) {
      Get.snackbar('Login Failed', e.toString());
    } finally {
      isLoading.value = false;
    }
  }




  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();
    super.onClose();
  }
}
