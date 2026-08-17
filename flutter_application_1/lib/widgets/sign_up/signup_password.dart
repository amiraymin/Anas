import 'package:flutter/material.dart';

class PasswordSignUp extends StatefulWidget {
  const PasswordSignUp({super.key});

  @override
  State<PasswordSignUp> createState() => _PasswordSignUpState();
}

class _PasswordSignUpState extends State<PasswordSignUp> {

  // 🔒 Stores the password typed by the user
  final passwordController = TextEditingController();

  // 👁️ Controls whether the password is hidden or visible
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // 🔒 PASSWORD LABEL
        Text(
          "Password",
          style: TextStyle(
            color: Color(0xff7C7C7C),
            fontWeight: FontWeight(600),
            fontSize: 16,
          ),
        ),

        // 🔒 PASSWORD TEXT FIELD
        TextFormField(

          // Connect field to passwordController
          controller: passwordController,

          // Hide / show password
          obscureText: obscurePassword,

          // 🔒 PASSWORD VALIDATION
          validator: (value) {

            // Password is empty
            if (value == null || value.isEmpty) {
              return "Please enter your password";
            }

            // Password is less than 8 characters
            if (value.length < 8) {
              return "Password must be at least 8 characters";
            }

            // Password is valid
            return null;
          },

          decoration: InputDecoration(

            // 👁️ EYE BUTTON
            suffixIcon: IconButton(
              icon: Icon(
                obscurePassword
                    ? Icons.visibility_off
                    : Icons.visibility,
              ),

              // When the eye is clicked
              onPressed: () {
                setState(() {
                  obscurePassword = !obscurePassword;
                });
              },
            ),

            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xffE0E0E0),
              ),
            ),
          ),

          // Close keyboard when tapping outside
          onTapOutside: (v) {
            FocusScope.of(context).unfocus();
          },
        ),

        SizedBox(height: 15),
      ],
    );
  }
}