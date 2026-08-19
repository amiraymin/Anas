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
  int currentIndex =0;

  List<Widget> screens =[
    ShopScreen(),
    ExploreScreen(),
    CartScreen(),
    FavoriteScreen(),
    AccountScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(child: screens [currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedItemColor: Color(0xff53B175),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        unselectedItemColor: Color.fromRGBO(24, 23, 37, 1),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.storefront_sharp),
            label: "Shop",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.manage_search_rounded),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_outlined),
            label: "Account",
          ),
        ],
        type: BottomNavigationBarType.fixed,

      ),

    );
  }
}
