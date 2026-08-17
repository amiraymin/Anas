import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/log_in/login_email.dart';
import 'package:flutter_application_1/widgets/log_in/login_header.dart';
import 'package:flutter_application_1/widgets/log_in/login_password.dart';
import 'package:flutter_application_1/widgets/log_in/login_button.dart';
import 'package:flutter_application_1/widgets/log_in/login_signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controllers store what the user types
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Used to validate the whole form
  final _formKey = GlobalKey<FormState>();

  // Controls whether the password is hidden or visible
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFCFCFC),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LoginHeader(),
                  LoginEmail(emailController: emailController),
                  LoginPassword(passwordController: passwordController),
                  LoginButton(formKey: _formKey),
                  LoginSignup(
                    onSignupPressed: () {
                      Navigator.pop(context);
                    },
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
