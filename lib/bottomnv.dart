import 'package:coffee_store_ui/views/homepage.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

int currentIndex = 0;

List<Widget> pages = [const HomePage(), const HomePage(), const HomePage()];

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          fixedColor: Colors.orange,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(FeatherIcons.heart), label: 'Favourite'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag), label: 'Cart')
          ]),
    );
  }
}
