import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inglab_flutter_test/app/data/remote/network/base_dio.dart';
import 'package:inglab_flutter_test/app/data/remote/remote_constants.dart';
import 'package:inglab_flutter_test/app/data/remote/responses/contacts_response.dart';

class HomeController extends GetxController {
  final Dio service = BaseDio().init();

  final formGlobalKey = GlobalKey<FormState>();
  final searchController = TextEditingController().obs;

  var contactList = <ContactData>[].obs;
  var filteredContactList = <ContactData>[].obs;
  var isLoadingContainer = false.obs;
  
  @override
  void onInit() {
    super.onInit();

    Future.delayed(Duration.zero, () async {
      loadRemoteContacts();
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void loadRemoteContacts() async {
    try {
      isLoadingContainer.value = true;
      final data = await service.get(ContactRepositories.contacts);
      isLoadingContainer.value = false;

      final wrapper = ContactsResponse.fromJson(data.data);
      contactList.assignAll(wrapper.data ?? []);
      contactList.sort((a, b) => a.name.toString().compareTo(b.name.toString()));

      filteredContactList.assignAll(contactList);
    } on DioException catch (e) {
      isLoadingContainer.value = false;
      Get.snackbar(
          "Error",
          "Cannot retrieve data from server",
          colorText: Colors.white,
          backgroundColor: Colors.red);
    }
  }

  void searchNameEmail(String text) {
    filteredContactList.clear();
    contactList.forEach((element) {
      if ((element.name ?? "").contains(text) || (element.email ?? "").contains(text)) {
        filteredContactList.add(element);
      }
    });
  }

  void resetFileteredContact() {
    filteredContactList.clear();
    filteredContactList.assignAll(contactList);
  }
}
