import 'package:flutter/material.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // ==================================================
        // LOGO
        // ==================================================

        Center(
          child: Image.asset(
            "assets/imges/carrot.png",
          ),
        ),

        SizedBox(height: 120),

        // ==================================================
        // TITLE
        // ==================================================

        Text(
          "Sign Up",
          style: const TextStyle(
            color: Color(0xff030303),
            fontWeight: FontWeight(600),
            fontSize: 26,
          ),
        ),

        // ==================================================
        // SUBTITLE
        // ==================================================

        Text(
          "Enter your credentials to continue",
          style: const TextStyle(
            color: Color(0xff7C7C7C),
            fontWeight: FontWeight(400),
            fontSize: 16,
          ),
        ),

        SizedBox(height: 30),
      ],
    );
  }
}