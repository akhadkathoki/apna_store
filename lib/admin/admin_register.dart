import 'dart:convert';

import 'package:apna_store/api_connect/api_connection.dart';
import 'package:apna_store/Screens/authentication/login_page.dart';
import 'package:apna_store/models/user.dart';
import 'package:apna_store/Screens/securityScreen/otp_verification_screen.dart';
import 'package:apna_store/Utils/utils.dart';
import 'package:apna_store/img_file.dart';
import 'package:apna_store/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:random_string/random_string.dart';

class AdminRegistrationScreen extends StatefulWidget {
  @override
  _AdminRegistrationScreenState createState() =>
      _AdminRegistrationScreenState();
}

class _AdminRegistrationScreenState extends State<AdminRegistrationScreen> {
  final _obscurePassword = true.obs;
  final _obscureConfirmPassword = true.obs;
  var formKey = GlobalKey<FormState>();
  bool isLoading = false;
  FirebaseAuth auth = FirebaseAuth.instance;

  // form fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController adminEmailController = TextEditingController();
  final TextEditingController adminPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // Function to handle user registration
  Future<void> register() async {
    setState(() {
      isLoading = true;
    });

    auth
        .createUserWithEmailAndPassword(
      email: adminEmailController.text.trim(),
      password: adminPasswordController.text.trim(),
    )
        .then((value) {
      setState(() {
        isLoading = false;
        String user_id = randomNumeric(5);
        Map<String, dynamic> userData = {
          'user_id': user_id,
          'user_name': nameController.text.trim(),
          'user_phone': phoneController.text.trim(),
          'user_email': adminEmailController.text.trim(),
          'user_password': adminPasswordController.text.trim(),
        };
        DatabaseMethods().addUserDetails(userData, user_id);
        Utils().toasMessage("Registered Successfully");
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => LoginScreen()));
      });
    }).onError(
      (error, stackTrace) {
        Utils().toasMessage(error.toString());
        setState(() {
          isLoading = false;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height for responsiveness
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Center(
            child: SizedBox(
              width: screenWidth * 0.99,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: screenHeight * 0.05),
                    // Logo at the top
                    Image.asset(
                      logo,
                      height: screenHeight * 0.25,
                    ),
                    SizedBox(height: screenHeight * 0.05),
                    const Divider(
                      thickness: 0.5,
                      color: Color(0xFF4F2D19),
                    ),
                    Text(
                      "Register",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: screenWidth * 0.08, // Dynamic font size
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const Divider(
                      thickness: 0.5,
                      color: Color(0xFF4F2D19),
                    ),
                    SizedBox(
                        height: screenHeight * 0.04), // 4% of screen height

                    // Input Fields
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          // Full Name Field
                          Material(
                            elevation: 9,
                            shadowColor: const Color.fromARGB(255, 180, 105, 62)
                                .withOpacity(0.15),
                            borderRadius: BorderRadius.circular(40),
                            child: TextFormField(
                              controller: nameController,
                              decoration: const InputDecoration(
                                hintText: 'Full Name',
                              ),
                            ),
                          ),
                          SizedBox(
                              height: screenWidth * 0.05), // Dynamic spacing

                          // Email Field
                          Material(
                            elevation: 9,
                            shadowColor: const Color.fromARGB(255, 180, 105, 62)
                                .withOpacity(0.15),
                            borderRadius: BorderRadius.circular(40),
                            child: TextFormField(
                              controller: phoneController,
                              keyboardType: TextInputType.phone,
                              decoration: const InputDecoration(
                                hintText: 'Phone',
                              ),
                            ),
                          ),
                          SizedBox(height: screenWidth * 0.05),

                          // Email Field
                          Material(
                            elevation: 9,
                            shadowColor: const Color.fromARGB(255, 180, 105, 62)
                                .withOpacity(0.15),
                            borderRadius: BorderRadius.circular(40),
                            child: TextFormField(
                              controller: adminEmailController,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: const InputDecoration(
                                hintText: 'Email',
                              ),
                            ),
                          ),
                          SizedBox(height: screenWidth * 0.05),

                          // Password Field
                          Material(
                            elevation: 9,
                            shadowColor: const Color.fromARGB(255, 180, 105, 62)
                                .withOpacity(0.15),
                            borderRadius: BorderRadius.circular(40),
                            child: Obx(
                              () => TextFormField(
                                controller: adminPasswordController,
                                obscureText: _obscurePassword.value,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _obscurePassword.value
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _obscurePassword.value =
                                            !_obscurePassword.value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: screenWidth * 0.05),

                          // Confirm Password Field
                          Material(
                            elevation: 9,
                            shadowColor: const Color.fromARGB(255, 180, 105, 62)
                                .withOpacity(0.15),
                            borderRadius: BorderRadius.circular(40),
                            child: Obx(
                              () => TextFormField(
                                controller: confirmPasswordController,
                                obscureText: _obscureConfirmPassword.value,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                  hintText: 'Confirm Password',
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _obscureConfirmPassword.value
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _obscureConfirmPassword.value =
                                            !_obscureConfirmPassword.value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(
                              height:
                                  screenHeight * 0.06), // 6% of screen height

                          // Register Button
                          SizedBox(
                            width: screenWidth * 0.5, // 50% of screen width
                            child: ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  register();
                                }

                                // Show OTP Verification Dialog
                                // showDialog(
                                //   context: context,
                                //   builder: (BuildContext context) {
                                //     return registerOtpVerificationDialog(
                                //         screenWidth, screenHeight);
                                //   },
                                // );
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size.fromHeight(50),
                              ),
                              child: isLoading
                                  ? const Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CircularProgressIndicator(
                                            strokeAlign: 0,
                                            color: Color.fromARGB(
                                                255, 249, 213, 189)),
                                        SizedBox(width: 20),
                                        Text('Adding...'),
                                      ],
                                    )
                                  : Text('Register'),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                        height: screenHeight * 0.03), // 3% of screen height

                    // Already have an account?
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account? ",
                          style: TextStyle(color: Color(0xFF4F2D19)),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.to(() => LoginScreen());
                            // Navigator.of(context).push(MaterialPageRoute(
                            //     builder: (context) =>
                            //         LoginScreen())); // Go back to the login screen
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              color: Color(0xFF4F2D19),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Dialog registerOtpVerificationDialog(
      double screenWidth, double screenHeight) {
    return Dialog(
      backgroundColor: const Color(0xFFFAE3C6),
      elevation: 9,
      shadowColor: const Color.fromARGB(255, 180, 105, 62).withOpacity(0.15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Adjust dialog width and height based on screen size
          return Container(
            width: screenWidth * 0.85, // 85% of screen width
            height: screenHeight * 0.5, // 50% of screen height
            padding: const EdgeInsets.all(16.0),
            child: OTPVerificationScreen(),
          );
        },
      ),
    );
  }
}
