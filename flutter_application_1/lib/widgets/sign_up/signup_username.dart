import 'package:flutter/material.dart';

class UserSignUp extends StatefulWidget {
  const UserSignUp({super.key});

  @override
  State<UserSignUp> createState() => _UserSignUpState();
}

class _UserSignUpState extends State<UserSignUp> {

  // 👤 Stores the username typed by the user
  final usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // 👤 USERNAME LABEL
        Text(
          "Username",
          style: TextStyle(
            color: Color(0xff7C7C7C),
            fontWeight: FontWeight(600),
            fontSize: 16,
          ),
        ),

        // 👤 USERNAME TEXT FIELD
        TextFormField(
          controller: usernameController,

          // 👤 USERNAME VALIDATION
          validator: (value) {

            // Username is empty
            if (value == null || value.isEmpty) {
              return "Please enter your username";
            }

            // Username is valid
            return null;
          },

          decoration: InputDecoration(
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

        SizedBox(height: 30),
      ],
    );
  }
}