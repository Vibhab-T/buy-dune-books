import 'package:ecommerce/components/bottom_nav_bar.dart';
import 'package:ecommerce/pages/cart_page.dart';
import 'package:ecommerce/pages/shop_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _buildDrawerItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.white, size: 22),
      title: Text(text, style: TextStyle(color: Colors.white, fontSize: 16)),
      onTap: onTap,
    );
  }

  int selectedIndex = 0;
  void navBottomBar(index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List pages = [const ShopPage(), const CartPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navBottomBar(index),
      ),
      body: pages[selectedIndex],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(Icons.menu, color: Colors.orange),
            );
          },
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.orange.shade800,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //header
              DrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.orange.shade700, Colors.orange.shade900],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person,
                        size: 40,
                        color: Colors.orange.shade800,
                      ),
                    ),
                    SizedBox(height: 10),
                    const Text(
                      "Welcome Back!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "Fremen Wormrider",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),

              //nav items
              _buildDrawerItem(
                icon: Icons.info,
                text: "About",
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "The coming of an about page has been heralded like the coming of the Lisan-al-gaib",
                      ),
                    ),
                  );
                },
              ),

              const Spacer(),

              //logout at bototm
              const Divider(color: Colors.white54, thickness: 0.5),
              _buildDrawerItem(
                icon: Icons.logout,
                text: "Logout",
                onTap: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text("Logged out!")));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
