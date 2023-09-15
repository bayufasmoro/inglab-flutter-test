import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inglab_flutter_test/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final formGlobalKey = GlobalKey<FormState>();
  final usernameController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  var passwordVisibility = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // Method to open home page
  void goToHomePage() async {
    // Check if form is validated
    if (formGlobalKey.currentState!.validate()) {
      // Go to home page
      Get.toNamed(Routes.HOME);
    }
  }
}
