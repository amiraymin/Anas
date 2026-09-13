import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/main_screens/account_screen.dart';
import 'package:flutter_application_1/screens/main_screens/cart_screen.dart';
import 'package:flutter_application_1/screens/main_screens/explore_screen.dart';
import 'package:flutter_application_1/screens/main_screens/favorite_screen.dart';
import 'package:flutter_application_1/screens/main_screens/shop_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<BottomNav> {
  int currentIndex = 0;

  List<Widget> screens = [
    ShopScreen(),
    ExploreScreen(),
    CartScreen(),
    FavoriteScreen(),
    AccountScreen(),
   ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: screens[currentIndex]),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          selectedItemColor: const Color(0xff53B175),
          backgroundColor: Colors.white,
          unselectedItemColor: const Color(0xff181725),
          selectedLabelStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
          unselectedLabelStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.storefront_outlined), label: 'Shop'),
            BottomNavigationBarItem(icon: Icon(Icons.manage_search_rounded), label: 'Explore'),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined), label: 'Cart'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Favourite'),
            BottomNavigationBarItem(icon: Icon(Icons.person_outline_outlined), label: 'Account'),
          ],
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
