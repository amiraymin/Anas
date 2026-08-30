import 'package:flutter/material.dart';

class AccountOptions extends StatelessWidget {
  const AccountOptions({super.key,required this.text,required this.icon});
  final String text;
   final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Divider(color: Color(0xffE2E2E2),thickness: 1,height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              SizedBox(width: 15,),
              Icon(
               icon,
                weight: 18,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(width: 20),
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Icon(Icons.arrow_forward_ios),
              SizedBox(width: 15,)
            ],
          ),
        ),
      
      ],
    );
  }
}
