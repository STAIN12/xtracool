import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socool/constants/text_styles.dart';
import 'package:socool/widgets/audio_card.dart';

import '../providers/network_provider.dart';
import '../widgets/artist_card.dart';
import 'no_internet_screen.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Discovery",
          style: kTextStyleSize18.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Text(
                    "Around you",
                    style:
                        kTextStyleSize18.copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                AudioCard(),
                AudioCard(),
                AudioCard(),
                AudioCard(),
              ],
            ),

            ////////////////////////////////////////////
            ///////// Top Artist
            /////////////////////////////////////////
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 30.0, bottom: 10.0, left: 8.0),
                    child: Row(
                      children: [
                        Text(
                          "Top Artists",
                          style: kTextStyleSize18.copyWith(
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        ArtistCard(),
                        ArtistCard(),
                        ArtistCard(),
                        ArtistCard(),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
