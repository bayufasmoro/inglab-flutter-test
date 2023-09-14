import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inglab_flutter_test/res/app_colors.dart';
import 'package:inglab_flutter_test/res/app_icons.dart';
import 'package:inglab_flutter_test/utils/app_textstyles.dart';
import 'package:inglab_flutter_test/utils/validator.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.bgGradientBlueTop, AppColors.bgGradientBlueBottom],
        ),
        // boxShadow: [AppViewStyles.elevationRaised],
      ),
      child: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 60),
                child: Column(
                  children: [
                    Expanded(
                        child: Center(
                      child: Image.asset(
                        AppIcons.inglabLogo,
                        width: 250,
                        height: 100,
                      ),
                    )),
                    Obx(() => Form(
                      key: controller.formGlobalKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome To Inglab",
                              style: AppTextStyle.size18Bold(),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "Please enter your details to continue",
                              style: AppTextStyle.size12Normal(),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: controller.usernameController.value,
                              decoration: InputDecoration(
                                hintText: "User Name",
                                hintStyle: AppTextStyle.size14Normal().copyWith(color: AppColors.textLightGray),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                                validator: RequiredValidator(errorText: "Username cannot be empty"),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: controller.passwordController.value,
                              decoration: InputDecoration(
                                hintText: "Password",
                                hintStyle: AppTextStyle.size14Normal().copyWith(color: AppColors.textLightGray),
                                filled: true,
                                fillColor: Colors.white,
                                suffixIcon: IconButton(
                                    onPressed: () => controller.passwordVisibility.value = !controller.passwordVisibility.value,
                                    icon: Icon(controller.passwordVisibility.value ? Icons.visibility_off_outlined : Icons.visibility_outlined))
                              ),
                              obscureText: !controller.passwordVisibility.value,
                              validator: RequiredValidator(errorText: "Password cannot be empty"),
                            ),
                            Row(
                              children: [
                                Expanded(child: Container()),
                                TextButton(
                                    onPressed: () => print("Go to forgot password page!"),
                                    child: Text(
                                        "Forgot Password?",
                                      style: AppTextStyle.size12Bold(color: AppColors.textMunsel),
                                    ))
                              ],
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                  onPressed: () => controller.goToHomePage(),
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all<Color>(AppColors.buttonMunsel),
                                  ),
                                  child: Text("Login", style: AppTextStyle.size14Bold(color: Colors.white))
                              ),
                            )
                          ],
                        ),
                    ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
