import 'package:flutter/material.dart';

class LoginPassword extends StatefulWidget {
  final TextEditingController passwordController;

  const LoginPassword({super.key, required this.passwordController});

  @override
  State<LoginPassword> createState() => _LoginPasswordState();
}

class _LoginPasswordState extends State<LoginPassword> {
  // Controls whether the password is hidden
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ---------------- PASSWORD LABEL ----------------
        const Text(
          "Password",
          style: TextStyle(
            color: Color(0xff7C7C7C),
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),

        // ---------------- PASSWORD TEXT FIELD ----------------
        TextFormField(
          controller: widget.passwordController,

          // Hide / show password
          obscureText: obscurePassword,

          // ---------------- PASSWORD VALIDATION ----------------
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter your password";
            }

            if (value.length < 8) {
              return "Password must be at least 8 characters";
            }

            return null;
          },

          decoration: InputDecoration(
            // Bottom line
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xffE0E0E0)),
            ),

            // ---------------- EYE BUTTON ----------------
            suffixIcon: IconButton(
              icon: Icon(
                obscurePassword
                    ? Icons.visibility_off_outlined
                    : Icons.visibility_outlined,
              ),

              onPressed: () {
                setState(() {
                  obscurePassword = !obscurePassword;
                });
              },
            ),
          ),

          // Close keyboard when tapping outside
          onTapOutside: (v) {
            FocusScope.of(context).unfocus();
          },
        ),

        const SizedBox(height: 35),
      ],
    );
  }
}
