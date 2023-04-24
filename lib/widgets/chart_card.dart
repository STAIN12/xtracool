import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socool/constants/color.dart';

import '../constants/constant.dart';
import '../constants/text_styles.dart';
import '../providers/audio_player_provider.dart';
import '../screens/player_screen.dart';
import '../utils/custom_page_route.dart';

class ChartTwoCard extends StatelessWidget {
  ChartTwoCard({
    super.key,
    // required this.titleCardOne,
    // required this.subTitleCardOne,
    // required this.imageCardOne,
    // required this.audioURLCardOne,
    this.audioData,
  });

  final audioData;
  // final String titleCardOne;
  // final String subTitleCardOne;
  // final String imageCardOne;
  // final String audioURLCardOne;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ChartCard(
          audioData: audioData,
        ),
        // ChartCard(
        //   title: titleCardTwo,
        //   subTitle: '',
        //   image: '',
        //   audioURL: '',
        // ),
      ],
    );
  }
}

class ChartCard extends StatelessWidget {
  const ChartCard({
    super.key,
    this.audioData,
  });
  final audioData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: kPrimaryColorTwo,
                borderRadius: BorderRadius.circular(7),
              ),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      image: DecorationImage(
                          image:
                              NetworkImage(audioData['images']['coverart']),
                          fit: BoxFit.cover),
                    ),
                  ),
                  kSizedBoxHeight10,
                  Text(
                    audioData['title'],
                    overflow: TextOverflow.ellipsis,
                    style: kTextStyleSize15,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    audioData['subtitle'],
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: kTextStyleSize12,
                  )
                ],
              ),
            ),
            onTap: () {
              Provider.of<AudioPlayerProvider>(context, listen: false)
                  .currentAudioPlaying(audioData['key']);

              Provider.of<AudioPlayerProvider>(context, listen: false)
                  .currentAudioPlayingId = audioData['key'];

              Provider.of<AudioPlayerProvider>(context, listen: false)
                  .updateCurrentAudioDetail(audioData);

              Navigator.of(context).push(
                CustomPageRoute(
                  child: const PlayerScreen(),
                  direction: AxisDirection.up,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
