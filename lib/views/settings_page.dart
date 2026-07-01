import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopease/controller/app_controller.dart';
import 'package:shopease/views/change_password.dart';

import 'privacy_policy.dart';
import 'terms_conditions.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AppController>();

    final screenWidth = MediaQuery.of(context).size.width;

    double contentWidth;

    if (screenWidth < 600) {
      // Mobile
      contentWidth = screenWidth - 24;
    } else if (screenWidth < 900) {
      // Tablet
      contentWidth = screenWidth * 0.75;
    } else {
      // Laptop/Desktop
      contentWidth = screenWidth * 0.45;

      // Prevent it from becoming too wide
      if (contentWidth > 650) {
        contentWidth = 650;
      }
    }
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: contentWidth,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth < 600 ? 12 : 24,
                vertical: 20,
              ),
              child: Column(
                children: [
                  /// HEADER
                  Row(
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(30),
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          width: 46,
                          height: 46,
                          decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: .05),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: const Icon(Icons.arrow_back),
                        ),
                      ),

                      Expanded(
                        child: Center(
                          child: Text(
                            "settings".tr,
                            style: TextStyle(
                              fontSize: screenWidth < 600 ? 24 : 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 46),
                    ],
                  ),

                  const SizedBox(height: 35),

                  /// SETTINGS CARD
                  Obx(
                    () => buildCard(
                      context,
                      child: Column(
                        children: [
                          buildSwitchTile(
                            Icons.dark_mode_outlined,
                            "dark".tr,
                            controller.isDark.value,
                            controller.changeTheme,
                          ),

                          divider(),

                          buildSwitchTile(
                            Icons.notifications_outlined,
                            "notification".tr,
                            controller.notification.value,
                            controller.changeNotification,
                          ),

                          divider(),

                          buildLanguage(context, controller),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// ABOUT CARD
                  buildCard(
                    context,
                    child: Column(
                      children: [
                        buildNav(
                          context,
                          Icons.lock_outline,
                          "change_password".tr,
                          const ChangePasswordScreen(),
                        ),

                        divider(),

                        buildNav(
                          context,
                          Icons.privacy_tip_outlined,
                          "privacy".tr,
                          const PrivacyPolicyPage(),
                        ),

                        divider(),

                        buildNav(
                          context,
                          Icons.description_outlined,
                          "terms".tr,
                          const TermsConditionsPage(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCard(BuildContext context, {required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .06),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: child,
    );
  }

  Widget divider() {
    return const Padding(
      padding: EdgeInsets.only(left: 82),
      child: Divider(height: 1),
    );
  }

  /// SWITCH TILE
  Widget buildSwitchTile(
    IconData icon,
    String title,
    bool value,
    ValueChanged<bool> onChanged,
  ) {
    return SizedBox(
      height: 76,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: const BoxDecoration(
                color: Color(0xFFF4EEFF),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: const Color(0xFF6C3EF4), size: 24),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            GestureDetector(
              onTap: () => onChanged(!value),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                width: 44,
                height: 26,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: value
                      ? const Color(0xFF6C3EF4)
                      : const Color(0xFFD9D9D9),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: AnimatedAlign(
                  duration: const Duration(milliseconds: 250),
                  alignment: value
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    width: 22,
                    height: 22,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// LANGUAGE
  /// LANGUAGE
  Widget buildLanguage(BuildContext context, AppController controller) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: 76,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: const BoxDecoration(
                color: Color(0xFFF4EEFF),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.language_outlined,
                color: Color(0xFF6C3EF4),
                size: 24,
              ),
            ),

            const SizedBox(width: 16),

            Expanded(
              child: Text(
                "language".tr,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            Container(
              width: screenWidth < 600 ? 120 : 160,
              height: 42,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF4A4A4A) : Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isDark ? Colors.white24 : const Color(0xFFE0E0E0),
                ),
              ),
              child: Obx(
                () => DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: controller.language.value,
                    isExpanded: true,
                    dropdownColor: isDark
                        ? const Color(0xFF4A4A4A)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                    style: TextStyle(
                      fontSize: 16,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                    items: const [
                      DropdownMenuItem(
                        value: "English",
                        child: Text("English"),
                      ),
                      DropdownMenuItem(value: "Nepali", child: Text("Nepali")),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        controller.changeLanguage(value);
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// NAVIGATION
  Widget buildNav(
    BuildContext context,
    IconData icon,
    String title,
    Widget page,
  ) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => page));
      },
      child: SizedBox(
        height: 76,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: const BoxDecoration(
                  color: Color(0xFFF4EEFF),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: const Color(0xFF6C3EF4), size: 24),
              ),

              const SizedBox(width: 16),

              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              const Icon(
                Icons.chevron_right_rounded,
                color: Colors.grey,
                size: 26,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
