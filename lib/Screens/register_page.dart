import 'package:apna_store/Screens/login_page.dart';
import 'package:apna_store/Screens/securityScreen/otp_verification_screen.dart';
import 'package:apna_store/img_file.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    // Get the screen width and height for responsiveness
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
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
                  SizedBox(height: screenHeight * 0.04), // 4% of screen height

                  // Input Fields
                  register_input_fields(screenWidth),
                  SizedBox(height: screenHeight * 0.06), // 6% of screen height

                  // Register Button
                  SizedBox(
                    width: screenWidth * 0.5, // 50% of screen width
                    child: ElevatedButton(
                      onPressed: () {
                        // Show OTP Verification Dialog
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return register_otp_verification_dialog(
                                screenWidth, screenHeight);
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                      ),
                      child: const Text('Register'),
                    ),
                  ),

                  SizedBox(height: screenHeight * 0.03), // 3% of screen height

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
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  LoginScreen())); // Go back to the login screen
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
    );
  }

  Dialog register_otp_verification_dialog(
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

  Widget register_input_fields(double screenWidth) {
    return Column(
      children: [
        // Full Name Field
        Material(
          elevation: 9,
          shadowColor:
              const Color.fromARGB(255, 180, 105, 62).withOpacity(0.15),
          borderRadius: BorderRadius.circular(40),
          child: TextFormField(
            decoration: const InputDecoration(
              hintText: 'Full Name',
            ),
          ),
        ),
        SizedBox(height: screenWidth * 0.05), // Dynamic spacing

        // Phone Number Field
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color:
                    const Color.fromARGB(255, 180, 105, 62).withOpacity(0.15),
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
              print(
                  phone.completeNumber); // Full phone number with country code
            },
          ),
        ),
        SizedBox(height: screenWidth * 0.05),

        // Email Field
        Material(
          elevation: 9,
          shadowColor:
              const Color.fromARGB(255, 180, 105, 62).withOpacity(0.15),
          borderRadius: BorderRadius.circular(40),
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: 'Email',
            ),
          ),
        ),
        SizedBox(height: screenWidth * 0.05),

        // Password Field
        Material(
          elevation: 9,
          shadowColor:
              const Color.fromARGB(255, 180, 105, 62).withOpacity(0.15),
          borderRadius: BorderRadius.circular(40),
          child: TextFormField(
            obscureText: _obscurePassword,
            decoration: InputDecoration(
              hintText: 'Password',
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility_off : Icons.visibility,
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
        SizedBox(height: screenWidth * 0.05),

        // Confirm Password Field
        Material(
          elevation: 9,
          shadowColor:
              const Color.fromARGB(255, 180, 105, 62).withOpacity(0.15),
          borderRadius: BorderRadius.circular(40),
          child: TextFormField(
            obscureText: _obscureConfirmPassword,
            decoration: InputDecoration(
              hintText: 'Confirm Password',
              suffixIcon: IconButton(
                icon: Icon(
                  _obscureConfirmPassword
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obscureConfirmPassword = !_obscureConfirmPassword;
                  });
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
