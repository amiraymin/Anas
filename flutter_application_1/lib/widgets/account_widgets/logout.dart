import 'package:flutter/material.dart';

class LogoutFromAcc extends StatelessWidget {
  const LogoutFromAcc({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 67,
      width: 364,
      
      decoration: BoxDecoration(
        color: Color(0xffF2F3F2)
      ),
      
      child: Row(
        children: [
          SizedBox(width: 30,),
          Icon(Icons.logout,color:  Color(0xff53B175),fontWeight: FontWeight.bold,size: 25,),
          SizedBox(width: 100,),
          Text("Log Out",style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Color(0xff53B175)
          ),),
        ],
      ),
    );
  }
}