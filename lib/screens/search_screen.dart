import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/text_styles.dart';
import '../providers/network_provider.dart';
import 'no_internet_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search",
          style: kTextStyleSize18.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: //networkStatus.hasInternet
          const Center(
        child: Text("Search Screen"),
        // : NoInternetScreen(),
      ),
    );
  }
}
