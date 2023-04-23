import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import '../constants/color.dart';
import '../constants/constant.dart';
import '../constants/text_styles.dart';
import '../providers/audio_player_provider.dart';
import '../resource/audio_player_controller.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({Key? key}) : super(key: key);

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  @override
  Widget build(BuildContext context) {
    var audioProvider = Provider.of<AudioPlayerProvider>(context);

    return Scaffold(
      appBar: AppBar(
        // elevation: 0.0,
        leading: IconButton(
            splashRadius: 0.2,
            icon: const RotatedBox(
              quarterTurns: 3,
              child: Icon(
                Icons.arrow_back_ios,
                size: 18,
              ),
            ),
            onPressed: () => Navigator.of(context).pop()),
        actions: [
          IconButton(
            splashRadius: 0.2,
            icon: const Icon(
              Icons.more_vert,
              size: 18,
            ),
            onPressed: () {
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ///////////////////
                // Audio Image
                Container(
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: kSecondaryColor),
                      image: kDefaultAudioImage),
                ),

                //////////////////
                // Audio Title
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Text(
                        "audioProvider.currentAudioDetail audioProvider.currentAudioDetail ",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: kTextStyleSize15.copyWith(
                            fontWeight: FontWeight.w900),
                      ),
                      kSizedBoxHeight10,
                      Text(
                        "audioProvider.currentAudioDetail audioProvider.currentAudioDetail",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: kTextStyleSize10,
                      ),
                    ],
                  ),
                ),

                ////////////////////
                // Audio Controllers
                audioProvider.isLoadingAudioFile
                    ? const CircularProgressIndicator(
                        strokeWidth: 10.0,
                        color: kPrimaryColor,
                      )
                    : const AudioPlayerController()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
