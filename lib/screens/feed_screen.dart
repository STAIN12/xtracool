import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socool/api_service/api.dart';
import 'package:socool/constants/color.dart';
import 'package:socool/constants/constant.dart';
import 'package:socool/constants/text_styles.dart';
import 'package:socool/providers/audio_player_provider.dart';
import 'package:socool/screens/around_you_screen.dart';
import 'package:socool/screens/artist_screen.dart';
import 'package:socool/screens/chart_screen.dart';
import 'package:socool/widgets/audio_card.dart';

import '../providers/network_provider.dart';
import '../widgets/artist_card.dart';
import '../widgets/chart_card.dart';
import 'no_internet_screen.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    AudioPlayerProvider audioPlayerProvider =
        Provider.of(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Discovery",
            style: kTextStyleSize18.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        body: audioPlayerProvider.isChartTracksReady == false
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (overscroll) {
                    overscroll.disallowIndicator();
                    return false;
                  },
                  child: ListView(
                    // shrinkWrap: true,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Around you",
                              style: kTextStyleSize18.copyWith(
                                  fontWeight: FontWeight.w600),
                            ),
                            GestureDetector(
                              child: Text(
                                "view more",
                                style: kTextStyleSize12.copyWith(
                                  color: kYellowPrimaryColor,
                                ),
                              ),
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: ((context) => AroundYouScreen()),
                                ),
                              ),
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
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 30.0, bottom: 10.0, left: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Top Artists",
                                  style: kTextStyleSize18.copyWith(
                                      fontWeight: FontWeight.w600),
                                ),
                                GestureDetector(
                                  child: Text(
                                    "view more",
                                    style: kTextStyleSize12.copyWith(
                                      color: kYellowPrimaryColor,
                                    ),
                                  ),
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: ((context) => ArtistScreen()),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  ArtistCard(),
                                  ArtistCard(),
                                  ArtistCard(),
                                  ArtistCard(),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),

                      ////////////////////////////////////////////
                      ///////// Top Chats
                      /////////////////////////////////////////
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 30.0, bottom: 10.0, left: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Top Charts",
                                  style: kTextStyleSize18.copyWith(
                                      fontWeight: FontWeight.w600),
                                ),
                                GestureDetector(
                                  child: Text(
                                    "view more",
                                    style: kTextStyleSize12.copyWith(
                                      color: kYellowPrimaryColor,
                                    ),
                                  ),
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: ((context) => ChartScreen()),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // ChartTwoCard(
                          //   // titleCardOne: 'audioPlayerProvider.ch',
                          //   // subTitleCardOne: '',
                          //   // imageCardOne: '',
                          //   // audioURLCardOne: '',
                          //   // titleCardTwo: 'audioPlayerProvid',
                          //   // subTitleCardTwo: '',
                          //   // imageCardTwo: '',
                          //   // audioURLCardTwo: '',
                          // ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            : const CircularProgressIndicator());
  }
}
