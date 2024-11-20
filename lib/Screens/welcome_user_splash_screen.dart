import 'dart:async';

import 'package:apna_store/Screens/authentication/login_page.dart';
import 'package:apna_store/Screens/home_screen.dart';
import 'package:apna_store/Utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WelcomeSplashScreen extends StatefulWidget {
  const WelcomeSplashScreen({super.key});

  @override
  State<WelcomeSplashScreen> createState() => _WelcomeSplashScreenState();
}

class _WelcomeSplashScreenState extends State<WelcomeSplashScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  // Fetch current user's email
  String getCurrentUserEmail() {
    User? userData = FirebaseAuth.instance.currentUser;
    return userData?.email ??
        ''; // Return the current user's email or empty string if not logged in
  }

  // Fetch user-specific data from Firestore
  Stream<QuerySnapshot> fetchUserData() {
    String email = getCurrentUserEmail();
    return FirebaseFirestore.instance
        .collection('users') // You can replace with your collection
        .where('user_email',
            isEqualTo:
                email) // Fetch data where user_email matches the logged-in user's email
        .snapshots(); // Listen to real-time updates
  }

  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  // Navigate to the next screen after 3 seconds
  void _navigateToNextScreen() {
    final user = auth.currentUser; // Check if the user is authenticated
    Timer(
      const Duration(seconds: 3),
      () {
        if (user != null) {
          // User is logged in, navigate to HomeScreen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        } else {
          // User is not logged in, navigate to LoginScreen
          Utils().toasMessage("Login Failed");
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    LoginScreen()), // Replace with your LoginScreen
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 220, 188),
      body: StreamBuilder<QuerySnapshot>(
        stream: fetchUserData(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          // Check if the snapshot contains data
          if (snapshot.hasError) {
            return SnackBar(content: Text(snapshot.error.toString()));
          }

          if (snapshot.data!.docs.isEmpty) {
            return SnackBar(content: Text('No User Found!'));
          }

          // Get the first document (assuming there's only one document with matching email)
          var userData = snapshot.data!.docs.first;

          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Welcome"),
                Text(
                  "${userData['user_name']}", // Display the email or other user data
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
