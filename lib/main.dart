import 'package:flutter/material.dart';
import 'package:get/get.dart';
<<<<<<< HEAD
import 'package:shopease/controller/app_controller.dart';
import 'package:shopease/translation/app_translation.dart';

import 'package:shopease/views/Splashscreen.dart';

void main() {
  final appController = AppController();
  Get.put(appController);

  runApp(const MyApp());
=======
import 'package:shopease/bindings/initial_binding.dart';
import 'package:shopease/controller/app_controller.dart';
import 'package:shopease/translation/app_translation.dart';
import 'package:shopease/theme/app_theme.dart';
import 'package:shopease/views/Splashscreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(
    AppController(),
    permanent: true,
  );

  runApp(const ShopEaseApp());
>>>>>>> main
}

class ShopEaseApp extends StatelessWidget {
  const ShopEaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AppController>();

    return Obx(
      () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
<<<<<<< HEAD

        translations: AppTranslation(),
=======
        title: 'ShopEase',

        translations: AppTranslations(),
>>>>>>> main

        locale: controller.language.value == 'Nepali'
            ? const Locale('ne', 'NP')
            : const Locale('en', 'US'),

        fallbackLocale: const Locale('en', 'US'),

<<<<<<< HEAD
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
=======
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: controller.isDark.value
            ? ThemeMode.dark
            : ThemeMode.light,

        initialBinding: InitialBinding(),
>>>>>>> main

        home: const Splashscreen(),
      ),
    );
  }
}