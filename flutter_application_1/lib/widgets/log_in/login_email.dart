import 'package:flutter/material.dart';

class LoginEmail extends StatelessWidget {
  final TextEditingController emailController;

  const LoginEmail({super.key, required this.emailController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ---------------- EMAIL LABEL ----------------
        const Text(
          "Email",
          style: TextStyle(
            color: Color(0xff7C7C7C),
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),

        // ---------------- EMAIL TEXT FIELD ----------------
        TextFormField(
          controller: emailController,

          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter your email";
            }

            if (!value.contains("@")) {
              return "Email must contain @";
            }

            return null;
          },

          decoration: const InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffE0E0E0)),
            ),
          ),

          onTapOutside: (v) {
            FocusScope.of(context).unfocus();
          },
        ),

        const SizedBox(height: 30),
      ],
    );
  }
}
