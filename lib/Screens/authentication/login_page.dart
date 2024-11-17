import 'package:apna_store/Screens/securityScreen/otp_change_password.dart';
import 'package:apna_store/Screens/welcome_user_splash_screen.dart';
import 'package:apna_store/img_file.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final _obscurePassword = true.obs; // Observable for password visibility
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
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
                      "Login",
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
                            shadowColor: const Color.fromARGB(255, 180, 105, 62)
                                .withOpacity(0.15),
                            borderRadius: BorderRadius.circular(40),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                hintText: 'Email',
                              ),
                            ),
                          ),
                          SizedBox(height: screenWidth * 0.05),

                          // Password Field with visibility toggle
                          Material(
                            elevation: 5,
                            shadowColor: const Color.fromARGB(255, 180, 105, 62)
                                .withOpacity(0.5),
                            borderRadius: BorderRadius.circular(40),
                            child: TextFormField(
                              controller: passwordController,
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

                          // Remember Me and Forgot Password
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  // remember me buooton
                                  Checkbox(
                                    value: _rememberMe,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        _rememberMe = value ?? false;
                                      });
                                    },
                                  ),
                                  const Text(
                                    "Remember Me",
                                    style: TextStyle(
                                      color: Color(0xFF4F2D19),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
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
                                if (formKey.currentState?.validate() ?? false) {
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const WelcomeSplashScreen(),
                                    ),
                                  );
                                }
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
                    SizedBox(height: 15),

                    Text(
                      "or",
                      style: TextStyle(
                        fontSize: 16,
                        color: const Color.fromARGB(255, 104, 104, 104),
                      ),
                    ),

                    // Admin login line
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Admin Login",
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
