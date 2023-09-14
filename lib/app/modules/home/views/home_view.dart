import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:inglab_flutter_test/app/widgets/card_container.dart';
import 'package:inglab_flutter_test/app/widgets/highlight_text.dart';
import 'package:inglab_flutter_test/res/app_colors.dart';
import 'package:inglab_flutter_test/utils/app_textstyles.dart';
import 'package:inglab_flutter_test/utils/string_extension.dart';

import '../../../widgets/progress_container.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Obx(() =>
              Stack(
                children: [
                  buildContent(),
                  ProgressContainer(
                      isShow: controller.isLoadingContainer.value,
                      onDismiss: null),
                ],
              )),
        ));
  }

  Widget buildContent() {
    return Column(
      children: [
        Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.bgSkyBlue,
                  borderRadius: BorderRadius.circular(15.0)),
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              height: 30,
              child: Row(
                children: [
                  Icon(Icons.search),
                  SizedBox(width: 6.0),
                  Expanded(
                    child: TextField(
                      controller: controller.searchController.value,
                      style: AppTextStyle.size12Normal(
                          color: AppColors.textDarkGray),
                      decoration: InputDecoration.collapsed(
                        hintText: "Search...",
                        hintStyle: AppTextStyle.size12Normal(
                            color: AppColors.textLightGray),
                        border: InputBorder.none,
                      ),
                      onChanged: (value) {
                        controller.searchNameEmail(value);
                      },
                    ),
                  ),
                  SizedBox(width: 6.0),
                  InkWell(
                    onTap: () {
                      FocusScope.of(Get.context!).unfocus();
                      controller.searchController.value.text = "";
                      controller.resetFileteredContact();
                    },
                    child: Container(
                      width: 18.0,
                      height: 18.0,
                      decoration: BoxDecoration(
                          color: AppColors.bgGray,
                          borderRadius: BorderRadius.circular(9.0)),
                      child: Icon(
                        Icons.close,
                        size: 14,
                        color: AppColors.textDark,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 1.0,
          color: AppColors.borderLine,
        ),
        Expanded(
            child: Container(
              width: double.infinity,
              color: AppColors.bgLightGray,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Contacts",
                      style: AppTextStyle.size18Bold(),
                    ),
                  ),
                  SizedBox(height: 16),
                  Obx(
                        () =>
                        Expanded(
                          child: controller.contactList.isEmpty
                              ? emptyContent()
                              : controller.filteredContactList.isEmpty
                              ? emptySearch()
                              : ListView.separated(
                              itemCount: controller.filteredContactList.length,
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              itemBuilder: (context, index) {
                                return contactItem(index);
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(height: 10.0);
                              }),
                        ),
                  )
                ],
              ),
            ))
      ],
    );
  }

  Widget emptyContent() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              child: Text("Couldn't load data, please refresh and try again.")),
          SizedBox(height: 10),
          SizedBox(
            width: 100,
            height: 40,
            child: ElevatedButton(
              onPressed: () => controller.loadRemoteContacts(),
              child: Text(
                "Refresh",
                style: AppTextStyle.size16Bold(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all<Color>(AppColors.buttonMunsel),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget emptySearch() {
    return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("No Result Found", style: AppTextStyle.size16Bold()),
            Text("Sorry, we couldn't find any results", style: AppTextStyle.size12Normal())
          ],
        ));
  }

  Widget contactItem(int index) {
    var contact = controller.filteredContactList[index];

    return CardContainer(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Container(
          child: Row(
            children: [
              SizedBox(
                width: 48,
                height: 48,
                child: CardContainer(
                  bgColor: AppColors.bgPink,
                  radius: 24,
                  shadowColor: AppColors.shadowBlack,
                  child: Container(
                    child: Center(
                        child: Text(
                          (contact.name ?? "").getInitials(),
                          style: AppTextStyle.size18Bold(color: Colors.white),
                        )),
                  ),
                ),
              ),
              SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HighlightText(
                    text: contact.name ?? "",
                    highlight: controller.searchController.value.text,
                    style: AppTextStyle.size16Bold(),
                    highlightColor: AppColors.textHighlightMunsel,
                    highlightStyle: AppTextStyle.size16Bold(
                        color: AppColors.textHighlightMunsel),
                    ignoreCase: true,
                  ),
                  HighlightText(
                    text: contact.email ?? "",
                    highlight: controller.searchController.value.text,
                    style: AppTextStyle.size12Normal(),
                    highlightColor: AppColors.textHighlightMunsel,
                    highlightStyle: AppTextStyle.size12Normal(
                        color: AppColors.textHighlightMunsel),
                    ignoreCase: true,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
