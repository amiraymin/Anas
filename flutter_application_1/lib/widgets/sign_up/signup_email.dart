import 'package:flutter/material.dart';

class EmailsignUp extends StatefulWidget {
  const EmailsignUp({super.key});

  @override
  State<EmailsignUp> createState() => _EmailsignUpState();
}

class _EmailsignUpState extends State<EmailsignUp> {

  // Stores the email typed by the user
  final emailController = TextEditingController();

  // Controls whether the green checkmark appears
  bool isEmailValid = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // 📧 EMAIL LABEL
        Text(
          "Email",
          style: TextStyle(
            color: Color(0xff7C7C7C),
            fontWeight: FontWeight(600),
            fontSize: 16,
          ),
        ),

        // 📧 EMAIL TEXT FIELD
        TextFormField(
          controller: emailController,

          // Check email while typing
          onChanged: (value) {
            setState(() {
              isEmailValid = value.contains("@");
            });
          },

          // Email validation
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter your email";
            }

            if (!value.contains("@")) {
              return "Email must contain @";
            }

            return null;
          },

          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0xffE0E0E0),
              ),
            ),

            // 🟢 GREEN CHECKMARK
            suffixIcon: isEmailValid
                ? Icon(
                    Icons.check,
                    color: Color(0xff53B175),
                  )
                : null,
          ),

          // Close keyboard when tapping outside
          onTapOutside: (v) {
            FocusScope.of(context).unfocus();
          },
        ),

        SizedBox(height: 30),
      ],
    );
  }
}