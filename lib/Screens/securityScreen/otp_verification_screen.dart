import 'dart:async';
import 'package:apna_store/Screens/authentication/login_page.dart';
import 'package:flutter/material.dart';

class OTPVerificationScreen extends StatefulWidget {
  @override
  _OTPVerificationScreenState createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final List<TextEditingController> _otpControllers =
      List.generate(4, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());

  bool _isResendButtonEnabled = true;
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
    _timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // OTP title with bold style and large font
                  const Text(
                    "Enter OTP",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
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
                              height: 50,
                              margin: const EdgeInsets.symmetric(horizontal: 6),
                              child: TextFormField(
                                controller: _otpControllers[index],
                                focusNode: _focusNodes[index],
                                decoration: const InputDecoration(
                                  counterText: "",
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 1),
                                ),
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                maxLength: 1,
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
                 
                 
                  const SizedBox(height: 5),
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
                  // Verify OTP button
                  SizedBox(
                    width: constraints.maxWidth < 400
                        ? constraints.maxWidth * 0.6
                        : 200,
                    child: ElevatedButton(
                      onPressed: () {
                        String otp = _otpControllers
                            .map((controller) => controller.text)
                            .join();
                        print("Entered OTP: $otp");

                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      },
                      child: const Text('Verify OTP'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
