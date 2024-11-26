import 'package:apna_store/Screens/authentication/login_page.dart';
import 'package:apna_store/Screens/securityScreen/otp_change_password.dart';
import 'package:apna_store/Screens/welcome_user_splash_screen.dart';
import 'package:apna_store/Utils/utils.dart';
import 'package:apna_store/admin/admin_register.dart';
import 'package:apna_store/admin/dashboard.dart';
import 'package:apna_store/img_file.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class AdminLoginScreen extends StatefulWidget {
  @override
  _AdminLoginScreenState createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool isLoading = false;

  final adminEmailController = TextEditingController();
  final adminPasswordController = TextEditingController();
  final _obscurePassword = true.obs; // Observable for password visibility

  final auth = FirebaseAuth.instance;

  void login() {
    auth
        .signInWithEmailAndPassword(
            email: adminEmailController.text.trim(),
            password: adminPasswordController.text.toString())
        .then((value) {
      Utils().toasMessage("Login Succesfully");
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const WelcomeSplashScreen(),
        ),
      );
    }).onError((error, stackTrace) {
      Utils().toasMessage(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: LayoutBuilder(
          builder: (context, constraints) {
            return Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Logo
                      const Image(
                        image: AssetImage(logo), // Add your logo path here
                        height: 200,
                      ),
                      SizedBox(height: screenHeight * 0.05),

                      const Divider(thickness: 0.5, color: Color(0xFF4F2D19)),

                      Text(
                        "Admin Login",
                        style: TextStyle(
                          fontSize: screenWidth * 0.07,
                          fontWeight: FontWeight.w900,
                        ),
                      ),

                      const Divider(thickness: 0.5, color: Color(0xFF4F2D19)),
                      SizedBox(height: screenHeight * 0.03),

                      // Form for phone and password fields
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            // Email Field
                            Material(
                              elevation: 9,
                              shadowColor:
                                  const Color.fromARGB(255, 180, 105, 62)
                                      .withOpacity(0.15),
                              borderRadius: BorderRadius.circular(40),
                              child: TextFormField(
                                controller: adminEmailController,
                                keyboardType: TextInputType.visiblePassword,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email';
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: const InputDecoration(
                                  hintText: 'Email',
                                ),
                              ),
                            ),
                            SizedBox(height: screenWidth * 0.05),

                            // Password Field with visibility toggle
                            Material(
                              elevation: 5,
                              shadowColor:
                                  const Color.fromARGB(255, 180, 105, 62)
                                      .withOpacity(0.5),
                              borderRadius: BorderRadius.circular(40),
                              child: TextFormField(
                                controller: adminPasswordController,
                                keyboardType: TextInputType.visiblePassword,
                                validator: (value) => value == ""
                                    ? "Please enter your password"
                                    : null,
                                obscureText: _obscurePassword.value,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  suffixIcon: Obx(
                                    () => IconButton(
                                      icon: Icon(
                                        _obscurePassword.value
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                      ),
                                      onPressed: () {
                                        _obscurePassword.value =
                                            !_obscurePassword.value;
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: screenHeight * 0.02),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  width: 8,
                                ),
                                // forget password button
                                TextButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return forgetPasswordDialog();
                                      },
                                    );
                                  },
                                  child: const Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                      color: Color(0xFF4F2D19),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: screenHeight * 0.05),

                            // Login Button
                            SizedBox(
                              width: screenWidth * 0.5,
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.to(() => AdminDashScreen());
                                  // if (formKey.currentState!.validate()) {
                                  //   login();
                                  // }
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size.fromHeight(50),
                                ),
                                child: const Text('Login'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      const Text(
                        "or",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 104, 104, 104),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Admin login line
                      TextButton(
                        onPressed: () {
                          Get.to(() => LoginScreen());
                        },
                        child: Text(
                          "User Login",
                          style: TextStyle(
                            color: Colors.brown[600],
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Admin login line
                      TextButton(
                        onPressed: () {
                          Get.to(() => AdminRegistrationScreen());
                        },
                        child: Text(
                          "Admin Register",
                          style: TextStyle(
                            color: Colors.brown[600],
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // Forget Password Dialog
  Dialog forgetPasswordDialog() {
    return Dialog(
      backgroundColor: const Color(0xFFFAE3C6),
      elevation: 9,
      shadowColor: const Color.fromRGBO(180, 105, 62, 1).withOpacity(0.15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Reset Password",
              style: TextStyle(
                fontSize: MediaQuery.of(context).size.width * 0.07,
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'Enter Phone Number',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            IntlPhoneField(
              decoration: const InputDecoration(
                hintText: 'Phone Number',
                counterText: "",
              ),
              initialCountryCode: 'IN',
              onChanged: (phone) {
                print(phone.completeNumber);
              },
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Dialog(
                      backgroundColor: const Color(0xFFFAE3C6),
                      elevation: 9,
                      shadowColor: const Color.fromARGB(255, 180, 105, 62)
                          .withOpacity(0.15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: const OTPChangePassword(),
                    );
                  },
                );
              },
              child: const Text('Verify'),
            ),
          ],
        ),
      ),
    );
  }
}
