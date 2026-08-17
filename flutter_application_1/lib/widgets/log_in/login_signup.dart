import 'package:flutter/material.dart';

class LoginSignup extends StatelessWidget {
  final VoidCallback onSignupPressed;

  const LoginSignup({super.key, required this.onSignupPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // ---------------- SIGN UP TEXT ----------------
        const Text(
          "Don't have an account? ",
          style: TextStyle(
            color: Color(0xff030303),
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),

        // ---------------- SIGN UP BUTTON ----------------
        GestureDetector(
          onTap: onSignupPressed,

          child: const Text(
            "Signup",
            style: TextStyle(
              color: Color(0xff53B175),
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
