import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/text_styles.dart';
import '../providers/network_provider.dart';
import 'no_internet_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: kTextStyleSize18.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: //networkStatus.hasInternet
          const Center(
        child: Text("Profile Screen"),
        // : NoInternetScreen(),
      ),
    );
  }
}
