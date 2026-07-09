import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopease/controller/app_controller.dart';
import 'change_password2.dart';
import 'privacy_policy.dart';
import 'terms_conditions.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  static const Color primary = Color(0xFF6C3EF4);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AppController>();

    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final bool mobile = screenWidth < 600;
        final bool tablet = screenWidth >= 600 && screenWidth < 900;
        final bool desktop = screenWidth >= 900;

        // Full screen width logic
        double horizontalPadding = mobile ? 16 : 24;
        if (desktop) horizontalPadding = 40;

        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: mobile ? 20 : 32,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // HEADER
                  Row(
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(50),
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          width: mobile ? 48 : 56,
                          height: mobile ? 48 : 56,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).cardColor,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: .06),
                                blurRadius: 16,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Icon(Icons.arrow_back, size: mobile ? 24 : 28),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            "settings".tr,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: mobile ? 30 : 38,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: mobile ? 48 : 56),
                    ],
                  ),

                  SizedBox(height: mobile ? 32 : 48),

                  // SETTINGS SECTION
                  Obx(
                    () => _buildCard(
                      context,
                      child: Column(
                        children: [
                          _buildSwitchTile(
                            context: context,
                            icon: Icons.dark_mode_outlined,
                            title: "dark".tr,
                            value: controller.isDark.value,
                            onChanged: controller.changeTheme,
                            mobile: mobile,
                          ),
                          _divider(),
                          _buildSwitchTile(
                            context: context,
                            icon: Icons.notifications_outlined,
                            title: "notification".tr,
                            value: controller.notification.value,
                            onChanged: controller.changeNotification,
                            mobile: mobile,
                          ),
                          _divider(),
                          _buildLanguageTile(context, controller, mobile),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: mobile ? 28 : 36),

                  // ACCOUNT & LEGAL SECTION
                  _buildCard(
                    context,
                    child: Column(
                      children: [
                        _buildNavigationTile(
                          context: context,
                          icon: Icons.lock_outline_rounded,
                          title: "change_password".tr,
                          page: const ChangepasswordScreen(),
                          mobile: mobile,
                        ),
                        _divider(),
                        _buildNavigationTile(
                          context: context,
                          icon: Icons.privacy_tip_outlined,
                          title: "privacy".tr,
                          page: const PrivacyPolicyPage(),
                          mobile: mobile,
                        ),
                        _divider(),
                        _buildNavigationTile(
                          context: context,
                          icon: Icons.description_outlined,
                          title: "terms".tr,
                          page: const TermsConditionsPage(),
                          mobile: mobile,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // CARD
  Widget _buildCard(BuildContext context, {required Widget child}) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .06),
            blurRadius: 22,
            offset: const Offset(0, 0,
          ),
          )
        ],
      ),
      child: child,
    );
  }

  // DIVIDER
  Widget _divider() {
    return const Padding(
      padding: EdgeInsets.only(left: 82),
      child: Divider(height: 1),
    );
  }

  // SWITCH TILE
  Widget _buildSwitchTile({
    required BuildContext context,
    required IconData icon,
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
    required bool mobile,
  }) {
    return SizedBox(
      height: mobile ? 76 : 84,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: mobile ? 20 : 24),
        child: Row(
          children: [
            Container(
              width: mobile ? 50 : 58,
              height: mobile ? 50 : 58,
              decoration: const BoxDecoration(
                color: Color(0xFFF4EEFF),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: primary, size: mobile ? 25 : 30),
            ),
            SizedBox(width: mobile ? 18 : 22),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: mobile ? 18 : 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => onChanged(!value),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                width: 42,
                height: 24,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: value ? primary : const Color(0xFFD8D8D8),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: AnimatedAlign(
                  duration: const Duration(milliseconds: 220),
                  alignment: value
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    width: 20,
                    height: 20,
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

  // LANGUAGE TILE
  Widget _buildLanguageTile(
    BuildContext context,
    AppController controller,
    bool mobile,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return SizedBox(
      height: mobile ? 76 : 84,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: mobile ? 20 : 24),
        child: Row(
          children: [
            Container(
              width: mobile ? 50 : 58,
              height: mobile ? 50 : 58,
              decoration: const BoxDecoration(
                color: Color(0xFFF4EEFF),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.language_outlined,
                color: primary,
                size: mobile ? 25 : 30,
              ),
            ),
            SizedBox(width: mobile ? 18 : 22),
            Expanded(
              child: Text(
                "language".tr,
                style: TextStyle(
                  fontSize: mobile ? 18 : 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              width: mobile ? 130 : 160,
              height: mobile ? 42 : 48,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: isDark ? Colors.grey.shade800 : Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Obx(
                () => DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: controller.language.value,
                    isExpanded: true,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    dropdownColor: isDark ? Colors.grey.shade900 : Colors.white,
                    items: const [
                      DropdownMenuItem(
                        value: "English",
                        child: Text("English"),
                      ),
                      DropdownMenuItem(value: "Nepali", child: Text("Nepali")),
                    ],
                    onChanged: (value) {
                      if (value != null) controller.changeLanguage(value);
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

  // NAVIGATION TILE
  Widget _buildNavigationTile({
    required BuildContext context,
    required IconData icon,
    required String title,
    required Widget page,
    required bool mobile,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () =>
          Navigator.push(context, MaterialPageRoute(builder: (_) => page)),
      child: SizedBox(
        height: mobile ? 76 : 84,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: mobile ? 20 : 24),
          child: Row(
            children: [
              Container(
                width: mobile ? 50 : 58,
                height: mobile ? 50 : 58,
                decoration: const BoxDecoration(
                  color: Color(0xFFF4EEFF),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: primary, size: mobile ? 25 : 30),
              ),
              SizedBox(width: mobile ? 18 : 22),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: mobile ? 18 : 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                size: mobile ? 28 : 34,
                color: Colors.grey.shade500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}