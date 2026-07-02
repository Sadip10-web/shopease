import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';
import 'package:shopease/views/edit_profile_screen.dart';
import 'package:shopease/views/order_history_view.dart';
import 'package:shopease/views/settings_page.dart';
import 'package:shopease/views/wishlist_view.dart';

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
    return Scaffold(
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
                    radius: 75,
                    backgroundColor: kPrimaryPurple,
                    child: Icon(
                      Icons.account_circle_sharp,
                      size: 150,
                      color: Color.fromARGB(255, 124, 196, 218),
                    ),
                  ),
                  const Gap(12),
                  Text(
                    userName,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  const Gap(4),
                  Text(
                    userEmail,
                    style: const TextStyle(
                      fontSize: 17,
                      color: kLabelGrey,
                    ),
                  ),
                ],
              ),
            ),
    
            const Gap(30),
    
            // ---- Menu options ----
            _ProfileMenuTile(
              icon: Icons.edit,
              label: "Edit Profile",
              onTap: () {
               Get.to(()=>EditProfileScreen());
              },
            ),
    
            Gap(10),
    
            _ProfileMenuTile(
              icon: Icons.shopping_bag,
              label: "My Orders",
              onTap: (){
                Get.to(()=>OrderHistoryView());
              },
            ),
    
            
    
            Gap(10),
    
            _ProfileMenuTile(
              icon: Icons.favorite,
              label: "Wishlist",
               onTap: (){
                Get.to(()=>Wishlistview());
              },
            ),
    
            Gap(10),
    
            _ProfileMenuTile(
              icon: Icons.settings,
              label: "Settings",
              onTap: (){
                Get.to(()=>SettingsPage());  },
            ),
    
            Gap(10),
    
           
    
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
            
            },
            child: const Text("Logout", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}


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
      
      child: Card(
        
        child: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15,top: 20,bottom: 20),
          child: Row(
            children: [
              Icon(icon, color: iconColor ?? kPrimaryPurple, size: 28),Gap(10),
              const Gap(16),
              Expanded(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: labelColor ?? Colors.black,
                  ),
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 16, color: kLabelGrey),
            ],
          ),
        ),
      ),
    );
  }
}
