import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: Image.asset("assets/imges/carrot.png")),

        const SizedBox(height: 120),

        const Text(
          "Login",
          style: TextStyle(
            color: Color(0xff030303),
            fontWeight: FontWeight.w600,
            fontSize: 26,
          ),
        ),

        const Text(
          "Enter your email and password",
          style: TextStyle(
            color: Color(0xff7C7C7C),
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),

        const SizedBox(height: 30),
      ],
    );
  }
}
