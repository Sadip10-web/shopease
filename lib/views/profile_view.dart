import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shopease/views/edit_profile_screen.dart';
import 'package:shopease/views/settings.dart';

// Brand colors reused from the rest of the app (see EditProfileScreen).
const Color kPrimaryPurple = Color(0xFF6D28FF);
const Color kLabelGrey = Color(0xff5B6475);

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // ---- Dummy/placeholder user data ----
  // TODO: replace with real data from GET /profile once the API is ready.
  final String userName = "John Doe";
  final String userEmail = "john@gmail.com";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: const Text(
            "Profile",
            style: TextStyle(
              color: Colors.black,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ---- Avatar + name + email ----
              Center(
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 60,
                      backgroundColor: kPrimaryPurple,
                      child: Icon(
                        Icons.account_circle_sharp,
                        size: 120,
                        color: Color.fromARGB(255, 124, 196, 218),
                      ),
                    ),
                    const Gap(12),
                    Text(
                      userName,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    const Gap(4),
                    Text(
                      userEmail,
                      style: const TextStyle(
                        fontSize: 15,
                        color: kLabelGrey,
                      ),
                    ),
                  ],
                ),
              ),

              const Gap(30),

              // ---- Menu options ----
              _ProfileMenuTile(
                icon: Icons.person_outline,
                label: "Edit Profile",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditProfileScreen(),
                    ),
                  );
                },
              ),
              _ProfileMenuTile(
                icon: Icons.receipt_long_outlined,
                label: "My Orders",
                onTap: () => _showComingSoon(context, "Order History"),
              ),
              _ProfileMenuTile(
                icon: Icons.location_on_outlined,
                label: "Manage Addresses",
                onTap: () => _showComingSoon(context, "Manage Addresses"),
              ),
              _ProfileMenuTile(
                icon: Icons.favorite_border,
                label: "Wishlist",
                onTap: () => _showComingSoon(context, "Wishlist"),
              ),
              _ProfileMenuTile(
                icon: Icons.settings_outlined,
                label: "Settings",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SettingsPage(
                        isDarkMode: false,
                        onThemeChanged: (value) {},
                      ),
                    ),
                  );
                },
              ),

              const Gap(20),
              const Divider(height: 1),
              const Gap(10),

              _ProfileMenuTile(
                icon: Icons.logout,
                label: "Logout",
                iconColor: Colors.red,
                labelColor: Colors.red,
                onTap: () => _confirmLogout(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showComingSoon(BuildContext context, String featureName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("$featureName coming soon")),
    );
  }

  void _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Logout"),
        content: const Text("Are you sure you want to logout?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // TODO: clear auth token (GetStorage) and navigate to Login
              // once that part of the app is wired up.
            },
            child: const Text("Logout", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}

// A single row in the profile menu list (e.g. "Edit Profile", "My Orders").
class _ProfileMenuTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? iconColor;
  final Color? labelColor;

  const _ProfileMenuTile({
    required this.icon,
    required this.label,
    required this.onTap,
    this.iconColor,
    this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          children: [
            Icon(icon, color: iconColor ?? kPrimaryPurple, size: 24),
            const Gap(16),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: labelColor ?? Colors.black,
                ),
              ),
            ),
            Icon(Icons.arrow_forward_ios, size: 16, color: kLabelGrey),
          ],
        ),
      ),
    );
  }
}
