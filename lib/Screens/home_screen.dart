import 'package:flutter/material.dart';

import 'package:apna_store/Screens/add_to_cart_page.dart';
import 'package:apna_store/Screens/favorite_page.dart';
import 'package:apna_store/Screens/home_page.dart';
import 'package:apna_store/Screens/order_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    MainHome(), // Home Page
    OrderPage(), // Order Page
    FavoritePage(), // Favorites Page
    AddToCartPage(), // Cart Page
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFFFAE3C6),
      bottomNavigationBar: bottomNavigationBar(context),
      body: _pages[_selectedIndex],
    );
  }

  Container bottomNavigationBar(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 214, 165), // Match AppBar color
        borderRadius: const BorderRadius.only(
          topLeft:
              Radius.circular(30), // Similar to AppBar's bottom rounded corners
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, -3), // Elevation effect from the bottom
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        child: BottomNavigationBar(
          iconSize: screenWidth * 0.07, // Dynamic icon size
          elevation: 10,
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: screenWidth * 0.035, // Dynamic font size
          ),
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.category_rounded),
              label: 'Order',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_rounded),
              label: 'Favorites',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_rounded),
              label: 'Cart',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor:
              const Color(0xFF4F2D19), // Match AppBar's primary color
          unselectedItemColor: Colors.black54,
          backgroundColor: const Color.fromARGB(
              255, 255, 214, 165), // Same background as AppBar
          onTap: _onItemTapped,
        ),
      ),
    );
  }

 
}
