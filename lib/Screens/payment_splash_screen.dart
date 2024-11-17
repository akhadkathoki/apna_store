import 'dart:async';
import 'package:apna_store/img_file.dart';
import 'package:apna_store/Screens/order_page.dart';
import 'package:flutter/material.dart';

class PaymentSuccessSplashScreen extends StatefulWidget {
  @override
  _PaymentSuccessSplashScreenState createState() =>
      _PaymentSuccessSplashScreenState();
}

class _PaymentSuccessSplashScreenState extends State<PaymentSuccessSplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initializing the animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Defining the animation curve
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutBack,
    );

    // Start the animation
    _controller.forward();

    // Timer for redirecting after 4 seconds
    Timer(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const OrderPage()));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0.0, 0.0),
            radius: 0.8,
            stops: [0.0, 0.3, 0.6, 0.9],
            colors: [
              Color(0xFFDFF6E0), // Light green
              Color.fromARGB(163, 178, 230, 168), // Mid green
              Color.fromARGB(184, 126, 200, 124), // Darker green
              Color.fromARGB(236, 76, 175, 79), // Primary green
            ],
          ),
        ),
        child: Center(
          child: FadeTransition(
            opacity: _animation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(successTick), // Green tick image
                const SizedBox(height: 20),
                const Text(
                  'Order Conformed!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 10, 63, 29), // Darker green
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Thank you for your purchase.',
                  style: TextStyle(
                    fontSize: 18,
                    color:
                        Color.fromARGB(200, 93, 94, 93), // Softer green shade
                  ),
                ),
                const SizedBox(height: 40),
                const CircularProgressIndicator(
                  color: Color.fromARGB(
                      255, 57, 65, 57), // Green progress indicator
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
