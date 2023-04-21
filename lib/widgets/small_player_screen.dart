import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/color.dart';
import '../constants/constant.dart';
import '../constants/text_styles.dart';
import '../resource/audio_player_controller.dart';
import '../screens/player_screen.dart';
import '../providers/audio_player_provider.dart';
import '../utils/custom_page_route.dart';
import 'audio_container_image.dart';

class SmallPlayerScreen extends StatefulWidget {
  const SmallPlayerScreen({Key? key}) : super(key: key);

  @override
  State<SmallPlayerScreen> createState() => _SmallPlayerScreenState();
}

class _SmallPlayerScreenState extends State<SmallPlayerScreen> {
  @override
  Widget build(BuildContext context) {
    var audio = Provider.of<AudioPlayerProvider>(context);

    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        CustomPageRoute(
            child: const PlayerScreen(
            ),
            direction: AxisDirection.up),
      ),
      child: Container(
        width: double.infinity,
        height: 70,
        color: kSecondaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const AudioImageContainer(imageWidth: 40, imageHeight: 40),
                  kSizedBoxWidth10,
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Apostle Oko",
                          overflow: TextOverflow.ellipsis,
                          style: kTextStyleSize8,
                        ),
                        Text(
                          'audioDetail[1]["title"]',
                          // 'What does the bible says. What does the bible says. What does the bible says. What does the bible says. What does the bible says. What does the bible says. What does the bible says. What does the bible says. What does the bible says',
                          overflow: TextOverflow.ellipsis,
                          style: kTextStyleSize8.copyWith(
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const AudioPlayerController(
              isSmallScreen: true,
            )
          ],
        ),
      ),
    );
  }
}
