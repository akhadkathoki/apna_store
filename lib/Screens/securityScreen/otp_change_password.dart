import 'dart:async';

import 'package:apna_store/Screens/authentication/login_page.dart';
import 'package:flutter/material.dart';

class OTPChangePassword extends StatefulWidget {
  const OTPChangePassword({super.key});

  @override
  _OTPChangePasswordState createState() => _OTPChangePasswordState();
}

class _OTPChangePasswordState extends State<OTPChangePassword> {
  final List<TextEditingController> _otpControllers =
      List.generate(4, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isResendButtonEnabled = true;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  int _resendCountdown = 30;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Ensure the previous input field is unfocused when moving between fields
    for (int i = 0; i < _focusNodes.length; i++) {
      _focusNodes[i].addListener(() {
        if (_focusNodes[i].hasFocus && i > 0) {
          _focusNodes[i - 1].unfocus();
        }
      });
    }
    startResendCountdown();
  }

  void startResendCountdown() {
    setState(() {
      _isResendButtonEnabled = false;
      _resendCountdown = 30; // Reset the countdown
    });

    // Start a Timer to decrease the countdown value every second
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_resendCountdown > 0) {
          _resendCountdown--;
        } else {
          _isResendButtonEnabled = true;
          timer.cancel(); // Stop the timer when countdown reaches 0
        }
      });
    });
  }

  @override
  void dispose() {
    // Clean up resources
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: 450,
          width: 600,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // OTP title with bold style and large font
                    const Text(
                      "Enter OTP",
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(height: 20),
                    const Divider(
                      thickness: 0.9,
                      color: Color(0xFF4F2D19),
                    ),
                    const SizedBox(height: 5),
                    // 4 input fields for OTP

                    SizedBox(
                      width: constraints.maxWidth < 500
                          ? constraints.maxWidth * 0.85
                          : 350,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(
                          4,
                          (index) {
                            return Expanded(
                              child: Container(
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 6),
                                height: 60,
                                child: TextFormField(
                                  controller: _otpControllers[index],
                                  focusNode: _focusNodes[index],
                                  decoration: const InputDecoration(
                                    counterText: "",
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 2),
                                  ),
                                  style: const TextStyle(
                                    fontSize: 20,
                                  ),
                                  keyboardType: TextInputType.number,
                                  textAlign: TextAlign.center,
                                  maxLength: 1,
                                  // Move focus to next field when input is entered
                                  onChanged: (value) {
                                    if (value.isNotEmpty && index < 3) {
                                      FocusScope.of(context)
                                          .requestFocus(_focusNodes[index + 1]);
                                    }
                                    if (value.isEmpty && index > 0) {
                                      FocusScope.of(context)
                                          .requestFocus(_focusNodes[index - 1]);
                                    }
                                  },
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    const Divider(
                      thickness: 0.9,
                      color: Color(0xFF4F2D19),
                    ),
                    // Resend OTP button with countdown
                    TextButton(
                      onPressed: _isResendButtonEnabled
                          ? () {
                              print("Resend OTP clicked");
                              startResendCountdown();
                            }
                          : null,
                      child: Text(
                        _isResendButtonEnabled
                            ? 'Resend OTP'
                            : 'Resend OTP in $_resendCountdown sec',
                        style: TextStyle(
                          fontWeight: _isResendButtonEnabled
                              ? FontWeight.bold
                              : FontWeight.normal,
                          decoration: _isResendButtonEnabled
                              ? TextDecoration.underline
                              : TextDecoration.none,
                          color: _isResendButtonEnabled
                              ? const Color(0xFF4F2D19)
                              : const Color.fromARGB(147, 83, 55, 39),
                          fontSize: 16,
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),
                    // Verify OTP and change password button
                    // Verify OTP button
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          String otp = _otpControllers
                              .map((controller) => controller.text)
                              .join();
                          print("Entered OTP: $otp");

                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return _enter_new_password();
                              });
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50),
                        ),
                        child: const Text('Verify OTP'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Dialog _enter_new_password() {
    return // Show OTP Verification Dialog
        Dialog(
      backgroundColor: const Color(0xFFFAE3C6),
      elevation: 9,
      shadowColor: const Color.fromARGB(255, 180, 105, 62).withOpacity(0.15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      child: SizedBox(
        height: 450,
        width: 600,
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Change Password",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 50),
              Material(
                elevation: 9,
                shadowColor:
                    const Color.fromARGB(255, 180, 105, 62).withOpacity(0.15),
                borderRadius: BorderRadius.circular(40),
                child: TextFormField(
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    hintText: 'New Password',
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
              const SizedBox(
                height: 20,
              ),
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
              const SizedBox(height: 40),
              // Verify OTP button
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    String otp = _otpControllers
                        .map((controller) => controller.text)
                        .join();
                    print("Entered OTP: $otp");

                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: const Text('Verify OTP'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
