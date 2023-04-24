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
  AudioAPI audioAPI = AudioAPI();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Discovery",
          style: kTextStyleSize18.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowIndicator();
            return false;
          },
          child: FutureBuilder(
              future: audioAPI.getCharts(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      snapshot.error.toString(),
                    ),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: kYellowPrimaryColor,
                    ),
                  );
                }
                print("object ${snapshot.data![4]}");
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: ((context, index) {
                      return AudioCard(
                        audioDetail: snapshot.data![index],
                      );
                    }));
              }),
        ),
      ),
    );
  }
}
