import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/sign_up/signup_email.dart';
import 'package:flutter_application_1/widgets/sign_up/signup_password.dart';
import 'package:flutter_application_1/widgets/sign_up/signup_header.dart';
import 'package:flutter_application_1/widgets/sign_up/signup_username.dart';
import 'login_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}
final usernameController = TextEditingController();
final emailController = TextEditingController();
final passwordController = TextEditingController();
final _formKey = GlobalKey<FormState>();

class _SignUpState extends State<SignUp> {
  bool obscurePassword = true;
  bool isEmailValid = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFCFCFC),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SignUpHeader(),
                  UserSignUp(),
                  EmailsignUp(),
                  PasswordSignUp(),
                  // ==================================================
                  // TERMS + PRIVACY POLICY
                  // ==================================================
                  RichText(
                    text: TextSpan(
                      children: [
                        // Normal gray text
                        TextSpan(
                          text: "By continuing you agree to our ",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight(400),
                            color: Color(0xff7C7C7C),
                          ),
                        ),

                        // 🟢 Green Terms of Service
                        TextSpan(
                          text: "Terms of Service ",
                          style: TextStyle(color: Color(0xff53B175)),
                        ),

                        // Normal gray text
                        TextSpan(
                          text: "\nand ",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight(400),
                            color: Color(0xff7C7C7C),
                          ),
                        ),

                        // 🟢 Green Privacy Policy
                        TextSpan(
                          text: "Privacy Policy",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight(400),
                            color: Color(0xff53B175),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 35),
                  // ==================================================
                  // SIGN UP BOTTOM
                  // ==================================================
                  Container(
                    height: 67,
                    width: 364,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Color(0xff53B175),
                    ),

                    // ----------------------------------------------
                    // SIGN UP BUTTON LOGIC
                    // ----------------------------------------------
                    child: GestureDetector(
                      onTap: () {
                        // Validate username + email + password
                        if (_formKey.currentState!.validate()) {
                          // ------------------------------------------
                          // EVERYTHING IS VALID
                          // Move to Login Screen
                          // ------------------------------------------

                          Navigator.push(
                            context,

                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        }
                      },

                      child: Center(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Color(0xffFFF9FF),
                            fontWeight: FontWeight(600),
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // ==================================================
                  // 🔑 "ALREADY HAVE AN ACCOUNT?"
                  // ==================================================
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(
                          color: Color(0xff030303),
                          fontWeight: FontWeight(600),
                          fontSize: 16,
                        ),
                      ),

                      // ----------------------------------------------
                      // 🟢 LOGIN TEXT
                      // Clicking it opens LoginScreen
                      // ----------------------------------------------
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,

                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },

                        child: Text(
                          "LogIn",
                          style: TextStyle(
                            color: Color(0xff53B175),
                            fontWeight: FontWeight(600),
                            fontSize: 16,
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
}
