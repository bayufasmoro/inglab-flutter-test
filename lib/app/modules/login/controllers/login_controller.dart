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

  void goToHomePage() async {
    if (formGlobalKey.currentState!.validate()) {

      Get.toNamed(Routes.HOME);
    }
  }
}
