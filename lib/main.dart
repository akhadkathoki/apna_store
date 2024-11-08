import 'package:apna_store/Screens/home_screen.dart';
import 'package:apna_store/Screens/order_page.dart';
import 'package:apna_store/Screens/starter_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Apna Store',
      theme: ThemeData(
        primaryColor: const Color(0xFF4F2D19),
        textTheme: const TextTheme(),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF4F2D19),
          foregroundColor: Color(0xFFFAE3C6),
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 239, 219),
        shadowColor: const Color.fromARGB(255, 180, 105, 62).withOpacity(0.15),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 15.0,
            horizontal: 20.0,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.only(
              top: 15,
              bottom: 15,
            ),
            backgroundColor: const Color(0xFF4F2D19),
            foregroundColor: const Color(0xFFFAE3C6),
            textStyle: const TextStyle(
              fontSize: 15,
              color: Color(0xFFFAE3C6),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        outlinedButtonTheme: const OutlinedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Color(0xFFFAE3C6)),
            foregroundColor: MaterialStatePropertyAll(Color(0xFF4F2D19)),
            textStyle: MaterialStatePropertyAll(
              TextStyle(
                fontSize: 20,
                color: Color(0xFF4F2D19),
                fontWeight: FontWeight.bold,
              ),
            ),
            side: MaterialStatePropertyAll(
              BorderSide(
                color: Color(0xFF4F2D19),
                width: 2.0,
              ),
            ),
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF4F2D19),
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
