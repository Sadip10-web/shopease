import 'package:flutter/material.dart';
import 'package:shopease/terms_conditions.dart';
import 'terms_condition.dart';

class SettingsPage extends StatefulWidget {
  final bool isDarkMode;
  final Function(bool) onThemeChanged;

  const SettingsPage({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notifications = true;
  String selectedLanguage = "English";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  // DARK MODE
                  ListTile(
                    leading: const Icon(
                      Icons.dark_mode,
                      color: Colors.deepPurple,
                    ),
                    title: Text(
                      selectedLanguage == "English" ? "Dark Mode" : "डार्क मोड",
                    ),
                    trailing: Switch(
                      value: widget.isDarkMode,
                      activeThumbColor: Colors.deepPurple,
                      onChanged: (value) {
                        widget.onThemeChanged(value);
                      },
                    ),
                  ),

                  const Divider(height: 1),

                  // NOTIFICATIONS
                  ListTile(
                    leading: const Icon(
                      Icons.notifications,
                      color: Colors.deepPurple,
                    ),
                    title: Text(
                      selectedLanguage == "English"
                          ? "Notifications"
                          : "सूचनाहरू",
                    ),
                    trailing: Switch(
                      value: notifications,
                      activeThumbColor: Colors.deepPurple,
                      onChanged: (value) {
                        setState(() {
                          notifications = value;
                        });
                      },
                    ),
                  ),

                  const Divider(height: 1),

                  // LANGUAGE
                  ListTile(
                    leading: const Icon(
                      Icons.language,
                      color: Colors.deepPurple,
                    ),
                    title: Text(
                      selectedLanguage == "English" ? "Language" : "भाषा",
                    ),
                    trailing: SizedBox(
                      width: 130,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: const Color(0xFFE5E7F0)),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedLanguage,
                            isExpanded: true,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: const [
                              DropdownMenuItem(
                                value: "English",
                                child: Text("English"),
                              ),
                              DropdownMenuItem(
                                value: "Nepali",
                                child: Text("नेपाली"),
                              ),
                            ],
                            onChanged: (value) {
                              setState(() {
                                selectedLanguage = value!;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  // CHANGE PASSWORD
                  ListTile(
                    leading: const Icon(Icons.lock, color: Colors.deepPurple),
                    title: Text(
                      selectedLanguage == "English"
                          ? "Change Password"
                          : "पासवर्ड परिवर्तन",
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Change Password Clicked"),
                        ),
                      );
                    },
                  ),

                  const Divider(height: 1),

                  // PRIVACY POLICY
                  ListTile(
                    leading: const Icon(Icons.shield, color: Colors.deepPurple),
                    title: Text(
                      selectedLanguage == "English"
                          ? "Privacy Policy"
                          : "गोपनीयता नीति",
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(
                            selectedLanguage == "English"
                                ? "Privacy Policy"
                                : "गोपनीयता नीति",
                          ),
                          content: Text(
                            selectedLanguage == "English"
                                ? "Your data is protected and secure."
                                : "तपाईंको डाटा सुरक्षित छ।",
                          ),
                        ),
                      );
                    },
                  ),

                  const Divider(height: 1),

                  // TERMS & CONDITIONS
                  ListTile(
                    leading: const Icon(
                      Icons.description,
                      color: Colors.deepPurple,
                    ),
                    title: Text(
                      selectedLanguage == "English"
                          ? "Terms & Conditions"
                          : "नियम तथा सर्तहरू",
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TermsConditionsPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
