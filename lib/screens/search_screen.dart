import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socool/constants/color.dart';
import 'package:socool/constants/constant.dart';
import 'package:socool/widgets/audio_card.dart';
import 'package:socool/widgets/custom_text_field.dart';

import '../constants/text_styles.dart';
import '../providers/network_provider.dart';
import 'no_internet_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(90),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Search",
                    style:
                        kTextStyleSize18.copyWith(fontWeight: FontWeight.bold),
                  ),
                  kSizedBoxHeight5,
                  CustomTextField(
                    enableBorderStyle: OutlineInputBorder(
                      borderSide: BorderSide(color: kYellowPrimaryColor),
                    ),
                    focusBorderStyle: OutlineInputBorder(
                      borderSide: BorderSide(color: kYellowPrimaryColor),
                    ),
                    controller: searchTextController,
                    hintString: 'Search song, artist, playlist',
                  ),
                ],
              ),
            ),
          ),
          body: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return AudioCard();
              })),
    );
  }
}
