import 'package:apna_store/admin/add_product.dart';
import 'package:apna_store/admin/product_list.dart';
import 'package:apna_store/img_file.dart';
import 'package:flutter/material.dart';
import 'package:apna_store/admin/users_management.dart';
import 'package:apna_store/admin/orders_management.dart';
import 'package:apna_store/admin/sales_statistics.dart';
import 'package:apna_store/admin/recent_activities.dart';

class AdminDashScreen extends StatelessWidget {
  const AdminDashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width; // Screen width
    final screenHeight = MediaQuery.of(context).size.height; // Screen height
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primaryColor,

        foregroundColor: theme.appBarTheme.backgroundColor,
        toolbarHeight: screenHeight * 0.1, // Dynamic height based on screen
        titleSpacing: 10,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        title: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.02), // Responsive padding
              child: ClipOval(
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    height: screenHeight * 0.07, // Responsive height
                    child: Image.asset(
                      profile,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Anshu Raj',
                    style: TextStyle(
                      fontSize: screenWidth * 0.05, // Responsive font size
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 255, 214, 165),
                    ),
                  ),
                  Text(
                    'Plus Member',
                    style: TextStyle(
                      fontSize: screenWidth * 0.03, // Responsive font size
                      color: const Color.fromARGB(255, 255, 214, 165),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.logout,
              color: const Color.fromARGB(255, 255, 214, 165),
              size: screenWidth * 0.08, // Responsive icon size
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          _buildMenuCard(
            context,
            "Add Product",
            Icons.add_rounded,
            ProductRegistrationPage(),
          ),
          _buildMenuCard(
            context,
            "Manage Users",
            Icons.people,
            const UsersManagementScreen(),
          ),
          _buildMenuCard(
            context,
            "Manage Orders",
            Icons.shopping_basket,
            const OrdersManagement(),
          ),
          _buildMenuCard(
            context,
            "Viwe Products",
            Icons.bar_chart,
            const ProductList(),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuCard(
      BuildContext context, String title, IconData icon, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Card(
          color: const Color.fromARGB(212, 245, 213, 177),
          margin: const EdgeInsets.all(10),
          child: Container(
            height: 163,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 70,
                  color: Colors.brown,
                ),
                Text(title)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
