import 'dart:async';

import 'package:apna_store/Screens/authentication/login_page.dart';
import 'package:apna_store/Screens/home_screen.dart';
import 'package:apna_store/Utils/utils.dart';
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

  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

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
          // User is not logged in, navigate to LoginScreen or other
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

  // final FirebaseAuth auth = FirebaseAuth.instance;
  // final user = auth.currentUser;
  // if(user != null){

  // }

  // @override
  // void initState() {
  //   super.initState();
  //   Timer(const Duration(seconds: 3), () {
  //     Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 220, 188),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome"),
            Text(
              "{First name} {Last name}",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
