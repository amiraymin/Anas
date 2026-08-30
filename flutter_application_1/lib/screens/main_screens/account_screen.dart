import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/account_widgets/account_options.dart';
import 'package:flutter_application_1/widgets/account_widgets/account_info.dart';
import 'package:flutter_application_1/widgets/account_widgets/logout.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
         children: [
           
              AccountInfo(),
              SizedBox(height: 30,),
              AccountOptions(text: "Orders",icon: Icons.local_mall_outlined),
             AccountOptions(text: "My Details",icon: Icons.contact_mail_outlined),
             AccountOptions(text: "Delivery Address",icon: Icons.location_on_outlined),
             AccountOptions(text: "Payment Methods",icon: Icons.credit_card_outlined),
             AccountOptions(text: "Promo Cord",icon: Icons.confirmation_num_outlined),
             AccountOptions(text: "Notifecations",icon: Icons.notifications_outlined),
             AccountOptions(text: "Help",icon: Icons.help_outline_outlined),
             AccountOptions(text: "About",icon: Icons.info_outline),
             SizedBox(height: 50,),

             LogoutFromAcc(),
         ],
        
    );
  }
}
