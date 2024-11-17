import 'package:apna_store/Screens/authentication/login_page.dart';
import 'package:apna_store/Utils/utils.dart';
import 'package:apna_store/admin/admin_profile_screen.dart';
import 'package:apna_store/img_file.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AdminDashScreen extends StatefulWidget {
  const AdminDashScreen({super.key});

  @override
  State<AdminDashScreen> createState() => _AdminDashScreenState();
}

class _AdminDashScreenState extends State<AdminDashScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width; // Screen width
    final screenHeight = MediaQuery.of(context).size.height; // Screen height

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Disables the back button
        backgroundColor: const Color.fromARGB(254, 77, 46, 28),
        foregroundColor: Color(0xFFFAE3C6),
        toolbarHeight: screenHeight * 0.1, // Dynamic height based on screen
        titleSpacing: 10,
        shape: RoundedRectangleBorder(
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AdminProfileScreen(),
                      ),
                    );
                  },
                  child: Container(
                    color: Colors.white,

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
                      color: theme.appBarTheme.foregroundColor,
                    ),
                  ),
                  Text(
                    'Plus Member',
                    style: TextStyle(
                      fontSize: screenWidth * 0.03, // Responsive font size
                      color: theme.appBarTheme.foregroundColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        actions: [
          // Logout Button
          IconButton(
            onPressed: () {
              // Add logout functionality here
              auth.signOut().then((value) {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginScreen()));
                Utils().toasMessage("Logged Out Successfully");
              }).onError((error, StackTrace) {
                Utils().toasMessage(error.toString());
              });
            },
            icon: const Icon(
              Icons.logout,
              color: Color.fromARGB(255, 253, 234, 211),
            ),
          ),
        ],
      ),
      backgroundColor: Color(0xFFFAE3C6),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF4F2D19),
        foregroundColor: Color(0xFFFAE3C6),
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: null,
    );
  }
}
