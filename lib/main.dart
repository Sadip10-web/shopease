import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopease/controller/app_controller.dart';
import 'package:shopease/settings_page.dart';
import 'package:shopease/translation/app_translation.dart';

import 'package:shopease/views/Splashscreen.dart';

void main() {
  final appController = AppController();
  Get.put(appController);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AppController>();

    return Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,

        translations: AppTranslation(),

        locale: controller.language.value == 'Nepali'
            ? const Locale('ne', 'NP')
            : const Locale('en', 'US'),

        fallbackLocale: const Locale('en', 'US'),

        theme: ThemeData(
          useMaterial3: false,
          scaffoldBackgroundColor: Colors.white,
        ),

        darkTheme: ThemeData(
          useMaterial3: false,
          brightness: Brightness.dark,
          scaffoldBackgroundColor: const Color(0xFF121212),
        ),

        themeMode: controller.isDark.value ? ThemeMode.dark : ThemeMode.light,

        home: const Splashscreen(),
      ),
    );
  }
}
