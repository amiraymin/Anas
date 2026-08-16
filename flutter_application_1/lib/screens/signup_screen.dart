import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFCFCFC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Center(child: Image.asset("assets/imges/carrot.png")),

              SizedBox(height: 120),

              Text(
                "Sign Up",
                style: const TextStyle(
                  color: Color(0xff030303),
                  fontWeight: FontWeight(600),
                  fontSize: 26,
                ),
              ),


              Text(
               "Enter your credentials to continue",
                style: const TextStyle(
                  color: Color(0xff7C7C7C),
                  fontWeight: FontWeight(400),
                  fontSize: 16,
                ),
              ),

              SizedBox(height: 30),

              Text("Username",
                  style: TextStyle(
                   color: Color(0xff7C7C7C),
                   fontWeight: FontWeight(600),
                   fontSize: 16,
                  ),
               ),

              TextFormField(
                
                // keybord unfocused mode
                onTapOutside: (v) { 
                  FocusScope.of(context).unfocus();
                },  
              
              ),
              SizedBox(height: 30),


                  Text("Email",
                  style: TextStyle(
                   color: Color(0xff7C7C7C),
                   fontWeight: FontWeight(600),
                   fontSize: 16,
                  ),
               ),
            
              TextFormField(
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xffE0E0E0)
                    )
                  ),
                  suffixIcon: Icon(Icons.check)
                ),
                // keybord unfocused mode
                onTapOutside: (v) { 
                  FocusScope.of(context).unfocus();
                },  
              ),

              SizedBox(height: 30),
                  Text(
                  "Password",
                  style: TextStyle(
                   color: Color(0xff7C7C7C),
                   fontWeight: FontWeight(600),
                   fontSize: 16,
                   ),
                  ),
              TextFormField(
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                            color: Color(0xffE0E0E0),
                    )
                  ),
                  suffixIcon: Icon(Icons.visibility_off)
                ),
                // keybord unfocused mode
                onTapOutside: (v) { 
                  FocusScope.of(context).unfocus();
                },  
              ),
              SizedBox(height: 15),
              RichText(
                text:TextSpan(
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(text: "By continuing you agree to our ", 
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight(400),
                      color: Color(0xff7C7C7C),
                    )),


                    TextSpan(
                      text: "Terms of Service ",
                        style: TextStyle(
                        color: Color(0xff53B175)
                        
                         )
                        ),

                    TextSpan(text: "\nand ", 
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight(400),
                      color: Color(0xff7C7C7C),
                    )),

                    TextSpan(
                        text: "Privacy Policy",
                        style: TextStyle(
                           fontSize: 14,
                      fontWeight: FontWeight(400),
                        color: Color(0xff53B175)
                       )
                  ),
               ]  
                )                         
                ),
                SizedBox(height: 35,),
                Container(
                  height: 67,
                  width: 364,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                  color: Color(0xff53B175),
                  
                  ),
      
                  child: Center(
                    child: Text("Sing Up",
                    style: TextStyle(
                      color: Color(0xffFFF9FF),
                      fontWeight: FontWeight(600),
                      fontSize: 18
                    ),),
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account? ",
                    style: TextStyle(
                      color: Color(0xff030303),
                      fontWeight: FontWeight(600),
                      fontSize: 16
                      )),
                    Text(" LogIn" ,
                     style: TextStyle(
                      color: Color(0xff53B175),
                      fontWeight: FontWeight(600),
                      fontSize: 16
                      ),),
                  ],
                )
              // new child here
            ],
          ),
        ),
      ),
    );
  }
}
