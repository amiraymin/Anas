import 'package:flutter/material.dart';

class AccountInfo extends StatelessWidget {
  const AccountInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return   Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(27),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.asset("assets/imges/profpic.webp").image,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("the Burnt peanut",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color(0xff181725),
                      fontFamily: "bold"
                    ),),
                    SizedBox(width: 5,)
                    ,Icon(Icons.edit_outlined,color: Color(0xff53B175),)
                  ],
                ),
                
                Text("Imshuvo97@gmail.com")
              ],
            ),
            
          ],
        );
  }
}