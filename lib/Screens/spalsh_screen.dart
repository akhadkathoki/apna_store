import 'package:apna_store/img_file.dart';
import 'package:flutter/material.dart';
import 'starter_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const StarterPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0.0, 0.0),
            radius: 0.8,
            stops: [0.0, 0.23, 0.53, 0.71, 0.88],
            colors: [
              Color(0xFFFAE3C6),
              Color(0xFFD1B79C),
              Color(0xFF9B7E66),
              Color(0xFF73533D),
              Color(0xFF4F2D19),
            ],
          ),
        ),
        child: Center(
          child: Image.asset(
            logo,
            width: 350,
          ),
        ),
      ),
    );
  }
}
