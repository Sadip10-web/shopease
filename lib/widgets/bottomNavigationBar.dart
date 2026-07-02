import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:shopease/views/cartScrenn_view.dart';
import 'package:shopease/views/category_view.dart';
import 'package:shopease/views/homescreen.dart';
import 'package:shopease/views/profile_view.dart';
import 'package:shopease/views/wishlist_view.dart';

class ButtomNavigationBar extends StatelessWidget {
  const ButtomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
    height: 65,
    decoration: BoxDecoration(
      color: Colors.white.withOpacity(0.15),
      borderRadius: BorderRadius.circular(30),
      border: Border.all(
        color: Colors.white.withOpacity(1),
        width: 0.8,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 5,
          spreadRadius: 5,
        ),
      ],
    ),
    child: Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Get.to(() => HomeScreen()),
            child: Icon(
              Icons.home_outlined,
              size: 35,
              
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () => Get.to(() => CategoryPage()),
            child: Icon(
              Icons.grid_view_outlined,
              size: 35,
              
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () => Get.to(() => Wishlistview()),
            child: Icon(
              Icons.favorite_border,
              size: 35,
              
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () => Get.to(() => Cartscreenview()),
            child: Badge(
              child: Icon(
                Icons.shopping_cart_outlined,
                size: 35,
                
              ),
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () => Get.to(() => ProfileScreen()),
            child: Icon(
              Icons.person_outline,
              size: 35,
              
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
}