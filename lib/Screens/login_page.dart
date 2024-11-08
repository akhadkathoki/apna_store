import 'package:apna_store/Screens/home_screen.dart';
import 'package:apna_store/Screens/securityScreen/otp_changePassword.dart';
import 'package:apna_store/Screens/securityScreen/otp_verification_screen.dart';
import 'package:apna_store/Screens/welcome_user_splash_screen.dart';
import 'package:apna_store/img_file.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.02,
              horizontal: screenWidth * 0.001,
            ),
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(screenWidth * 0.05),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Logo at the top
                      const Image(
                        image: AssetImage(logo), // Add your logo path
                        height: 200,
                      ),
                      SizedBox(height: screenHeight * 0.05),

                      const Divider(
                        thickness: 0.5,
                        color: Color(0xFF4F2D19),
                      ),

                      Text(
                        "Login",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: screenWidth * 0.07, // Responsive font size
                          fontWeight: FontWeight.w900,
                        ),
                      ),

                      const Divider(
                        thickness: 0.5,
                        color: Color(0xFF4F2D19),
                      ),
                      SizedBox(height: screenHeight * 0.03),

                      // Phone Field with elevation
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 180, 105, 62)
                                  .withOpacity(0.15),
                              blurRadius: 9,
                              offset: const Offset(0, 4),
                            )
                          ],
                        ),
                        child: IntlPhoneField(
                          decoration: const InputDecoration(
                            hintText: 'Phone Number',
                            counterText: "",
                          ),
                          initialCountryCode: 'IN', // Default country code
                          onChanged: (phone) {
                            print(phone.completeNumber);
                          },
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.03),

                      // Password Field with elevation
                      Material(
                        elevation: 5,
                        shadowColor: const Color.fromARGB(255, 180, 105, 62)
                            .withOpacity(0.5),
                        borderRadius: BorderRadius.circular(40),
                        child: TextFormField(
                          obscureText: _obscurePassword,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),

                      // Forgot password and Remember me area
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
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
                          TextButton(
                            onPressed: () {
                              // Show OTP Verification Dialog
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return forget_password();
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
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const WelcomeSplashScreen(),
                              ),
                            );
                          },
                          child: const Text('Login'),
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(50),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Dialog forget_password() {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Dialog(
      backgroundColor: const Color(0xFFFAE3C6),
      elevation: 9,
      shadowColor: const Color.fromRGBO(180, 105, 62, 1).withOpacity(0.15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      child: SizedBox(
        width: screenWidth * 1.5,
        height: screenHeight * 0.5,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(18, 0, 18, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Reset Password",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: screenWidth * 0.07, // Responsive font size
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 30),
              const Row(
                children: [
                  Text(
                    'Enter Phone Number ',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 180, 105, 62)
                          .withOpacity(0.15),
                      blurRadius: 9,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                child: IntlPhoneField(
                  decoration: const InputDecoration(
                    hintText: 'Phone Number',
                    counterText: "",
                  ),
                  initialCountryCode: 'IN', // Default country code
                  onChanged: (phone) {
                    print(phone.completeNumber);
                  },
                ),
              ),
              const SizedBox(height: 40),
              // Verify OTP button
              SizedBox(
                width: screenWidth * 0.5,
                child: ElevatedButton(
                  onPressed: () {
                    // Show OTP Verification Dialog
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
                          child: OTPChangePassword(),
                        );
                      },
                    );
                  },
                  child: const Text('Verify Number'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
