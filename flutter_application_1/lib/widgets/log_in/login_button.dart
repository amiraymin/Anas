import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final VoidCallback onLoginPressed;

  const LoginButton({
    super.key,
    required this.formKey,
    required this.onLoginPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            // Validate Email + Password
            if (formKey.currentState!.validate()) {
              onLoginPressed();
            }
          },

          child: Container(
            height: 67,
            width: double.infinity,

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: const Color(0xff53B175),
            ),

            child: const Center(
              child: Text(
                "Log In",
                style: TextStyle(
                  color: Color(0xffFFF9FF),
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 20),
      ],
    );
  }
}
