import 'package:apna_store/Screens/authentication/register_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
            backgroundColor: WidgetStatePropertyAll(Color(0xFFFAE3C6)),
            foregroundColor: WidgetStatePropertyAll(Color(0xFF4F2D19)),
            textStyle: WidgetStatePropertyAll(
              TextStyle(
                fontSize: 20,
                color: Color(0xFF4F2D19),
                fontWeight: FontWeight.bold,
              ),
            ),
            side: WidgetStatePropertyAll(
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
      home: FutureBuilder(
        future: null,
        builder: (context, dataSnapShot) {
          return RegistrationScreen();
        },
      ),
    );
  }
}
