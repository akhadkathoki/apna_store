import 'package:apna_store/Screens/authentication/login_page.dart';
import 'package:apna_store/Screens/authentication/register_page.dart';
import 'package:apna_store/img_file.dart';
import 'package:flutter/material.dart';

class StarterPage extends StatelessWidget {
  const StarterPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height for responsiveness
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF4F2D19), Color(0xFFFAE3C6)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Responsive image size based on screen width
                Image.asset(
                  starterImage,
                  width: screenWidth * 1, // 60% of screen width
                ),
                SizedBox(height: screenHeight * 0.15), // 10% of screen height
                Column(
                  children: [
                    // Responsive button width and height based on screen size
                    SizedBox(
                      width: screenWidth * 0.8, // 80% of screen width
                      height: screenHeight * 0.07, // 7% of screen height
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                        },
                        style: const ButtonStyle(
                          elevation: WidgetStatePropertyAll(5),
                          shadowColor:
                              WidgetStatePropertyAll(Color(0xFF4F2D19)),
                        ),
                        child: const Text("Login"),
                      ),
                    ),
                    SizedBox(
                        height: screenHeight * 0.03), // 5% of screen height
                    SizedBox(
                      width: screenWidth * 0.8,
                      height: screenHeight * 0.07,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => RegistrationScreen()));
                        },
                        style: const ButtonStyle(
                          elevation: WidgetStatePropertyAll(5),
                          shadowColor:
                              WidgetStatePropertyAll(Color(0xFF4F2D19)),
                        ),
                        child: const Text("Register"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
