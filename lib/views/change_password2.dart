import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController newPasswordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool obscureNew = true;
  bool obscureConfirm = true;

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  InputDecoration passwordDecoration({
    required BuildContext context,
    required String hint,
    required bool obscure,
    required VoidCallback onPressed,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return InputDecoration(
      filled: true,
      fillColor: isDark ? const Color(0xFF2A2A2A) : const Color(0xFFF4F1FC),

      hintText: hint,

      hintStyle: TextStyle(
        color: isDark ? Colors.grey.shade400 : const Color(0xFFB7B7C9),
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),

      contentPadding: const EdgeInsets.symmetric(vertical: 22),

      prefixIcon: const Icon(Icons.lock, color: Color(0xFF6D28FF)),

      suffixIcon: IconButton(
        onPressed: onPressed,
        icon: Icon(
          obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
          color: Colors.grey,
        ),
      ),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide.none,
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: BorderSide.none,
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(18),
        borderSide: const BorderSide(color: Color(0xFF6D28FF), width: 1.3),
      ),
    );
  }

  void changePassword() {
    if (newPasswordController.text.isEmpty ||
        confirmPasswordController.text.isEmpty) {
      Get.snackbar("error".tr, "fill_all_fields".tr);
      return;
    }

    if (newPasswordController.text != confirmPasswordController.text) {
      Get.snackbar("error".tr, "password_not_match".tr);
      return;
    }

    Get.snackbar(
      "success".tr,
      "password_changed".tr,
      duration: const Duration(seconds: 2),
    );

    Future.delayed(const Duration(seconds: 2), () => Get.back());
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final screenWidth = MediaQuery.of(context).size.width;

    // Responsive width
    double contentWidth;

    if (screenWidth < 600) {
      // Mobile
      contentWidth = screenWidth;
    } else if (screenWidth < 900) {
      // Tablet
      contentWidth = screenWidth * 0.75;
    } else {
      // Laptop/Desktop
      contentWidth = 520;
    }

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: contentWidth,

            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth < 600 ? 24 : 42,
                vertical: screenWidth < 600 ? 20 : 28,
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  /// BACK BUTTON
                  IconButton(
                    onPressed: () => Get.back(),
                    padding: EdgeInsets.zero,
                    splashRadius: 22,
                    icon: Icon(
                      Icons.arrow_back,
                      size: screenWidth < 600 ? 24 : 28,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),

                  SizedBox(height: screenWidth < 600 ? 34 : 42),

                  /// TITLE
                  Text(
                    "change_password_title".tr,

                    style: TextStyle(
                      fontSize: screenWidth < 600 ? 32 : 34,
                      fontWeight: FontWeight.w700,
                      letterSpacing: .3,
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                  ),

                  SizedBox(height: screenWidth < 600 ? 46 : 55),

                  /// NEW PASSWORD
                  Text(
                    "new_password".tr,

                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: isDark ? Colors.white70 : const Color(0xff5B6475),
                    ),
                  ),

                  const SizedBox(height: 16),

                  SizedBox(
                    height: 68,

                    child: TextField(
                      controller: newPasswordController,
                      obscureText: obscureNew,

                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                        fontSize: 16,
                      ),

                      decoration: passwordDecoration(
                        context: context,
                        hint: "enter_new_password".tr,
                        obscure: obscureNew,

                        onPressed: () {
                          setState(() {
                            obscureNew = !obscureNew;
                          });
                        },
                      ),
                    ),
                  ),

                  SizedBox(height: screenWidth < 600 ? 36 : 42),

                  /// CONFIRM PASSWORD
                  Text(
                    "confirm_password".tr,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: isDark ? Colors.white70 : const Color(0xFF5B6475),
                    ),
                  ),

                  const SizedBox(height: 16),

                  SizedBox(
                    height: 68,
                    child: TextField(
                      controller: confirmPasswordController,
                      obscureText: obscureConfirm,
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                      ),
                      decoration: passwordDecoration(
                        context: context,
                        hint: "reenter_new_password".tr,
                        obscure: obscureConfirm,
                        onPressed: () {
                          setState(() {
                            obscureConfirm = !obscureConfirm;
                          });
                        },
                      ),
                    ),
                  ),

                  SizedBox(height: screenWidth < 600 ? 52 : 60),

                  /// PROCEED BUTTON
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: changePassword,
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: const Color(0xFF6D28FF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: Text(
                        "proceed".tr,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: screenWidth < 600 ? 20 : 32),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
