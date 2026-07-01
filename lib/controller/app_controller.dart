import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  // Theme
  RxBool isDark = false.obs;

  void changeTheme(bool value) {
    isDark.value = value;
    Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
  }

  // Notification
  RxBool notification = true.obs;

  void changeNotification(bool value) {
    notification.value = value;
  }

  // Language
  RxString language = 'English'.obs;

  void changeLanguage(String value) {
    language.value = value;

    if (value == 'Nepali') {
      Get.updateLocale(const Locale('ne', 'NP'));
    } else {
      Get.updateLocale(const Locale('en', 'US'));
    }
  }
}
