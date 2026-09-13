import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/auth/login_screen.dart';

class LogoutFromAcc extends StatelessWidget {
  const LogoutFromAcc({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
         onTap: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const LoginScreen()),
          (route) => false,
        );
      },
      child: Container(
        height: 67,
        width: 364,
         
        decoration: BoxDecoration(color: Color(0xffF2F3F2),
        borderRadius: BorderRadius.circular(25)),
      
        child: Row(
          children: [
            SizedBox(width: 30),
            Icon(
              Icons.logout,
              color: Color(0xff53B175),
              fontWeight: FontWeight.bold,
              size: 25,
            ),
            SizedBox(width: 100),
            Text(
              "Log Out",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color(0xff53B175),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
