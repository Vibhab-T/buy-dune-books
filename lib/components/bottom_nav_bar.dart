import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatelessWidget {
  final void Function(int)? onTabChange;
  const MyBottomNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 50, right: 50),
      child: GNav(
        color: Colors.grey,
        activeColor: Colors.orange,
        tabActiveBorder: Border.all(color: Colors.orange),
        tabBackgroundColor: Colors.grey.shade100,
        tabBorderRadius: 15,
        onTabChange: (value) => onTabChange!(value),
        tabs: [
          GButton(icon: Icons.home, text: "Shop"),
          GButton(icon: Icons.shopping_cart, text: "Cart"),
        ],
      ),
    );
  }
}
