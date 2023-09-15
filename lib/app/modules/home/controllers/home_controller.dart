import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/remote_constants.dart';
import '../../../data/model/responses/contacts_response.dart';
import '../../../data/services/network/service.dart';

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
      // Show loading
      isLoadingContainer.value = true;

      // Method GET: /api/contacts/
      final data = await service.get(ContactRepositories.contacts);

      // Hide loading
      isLoadingContainer.value = false;

      // Mapping contacts response
      final wrapper = ContactsResponse.fromJson(data.data);
      contactList.assignAll(wrapper.data ?? []);
      contactList.sort((a, b) => a.name.toString().compareTo(b.name.toString()));

      filteredContactList.assignAll(contactList);
    } on DioException catch (e) {
      // Hide loading
      isLoadingContainer.value = false;

      // Show error snackbar
      Get.snackbar(
          "Error",
          "Cannot retrieve data from server",
          colorText: Colors.white,
          backgroundColor: Colors.red);
    }
  }

  // Method to search contact by name or email
  void searchNameEmail(String text) {
    filteredContactList.clear();
    contactList.forEach((element) {
      if ((element.name ?? "").contains(text) || (element.email ?? "").contains(text)) {
        filteredContactList.add(element);
      }
    });
  }

  // Method to clear search filter
  void resetFilteredContact() {
    filteredContactList.clear();
    filteredContactList.assignAll(contactList);
  }
}
