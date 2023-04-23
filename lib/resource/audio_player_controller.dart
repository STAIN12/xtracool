import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/color.dart';
import '../constants/constant.dart';
import '../constants/text_styles.dart';
import '../providers/audio_player_provider.dart';

class AudioPlayerController extends StatefulWidget {
  const AudioPlayerController({Key? key, this.isSmallScreen = false})
      : super(key: key);

  final bool isSmallScreen;

  @override
  State<AudioPlayerController> createState() => _AudioPlayerControllerState();
}

class _AudioPlayerControllerState extends State<AudioPlayerController> {
  final String onlinePath =
      "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3";

  // final String localPath = "downloads/complete.mp3";

  //////////////////////////////////
  //// Play & Pause audio button
  //////////////////////////////////
  Widget btnPlayStart() {
    // var audioProvider = Provider.of<AudioPlayerProvider>(context);
    return Provider.of<AudioPlayerProvider>(context).isPlayingIcons(context,
        'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3');
  }

  //////////////////////////////////
  //// Move to previous button
  //////////////////////////////////
  Widget btnMoveToPrevious() {
    return IconButton(
      splashRadius: 0.2,
      icon: const Icon(
        Icons.fast_rewind,
        size: kIconSize20,
        color: kYellowPrimaryColor,
      ),
      onPressed: () {},
    );
  }

  //////////////////////////////////
  //// Move to next button
  //////////////////////////////////
  Widget btnMoveToNext() {
    return IconButton(
      splashRadius: 0.2,
      icon: const Icon(
        Icons.fast_forward,
        size: kIconSize20,
        color: kYellowPrimaryColor,
      ),
      onPressed: () {},
    );
  }

  //////////////////////////////
  //// Slider Widget
  /////////////////////////////
  Widget sliderWidget() {
    return Provider.of<AudioPlayerProvider>(context).sliderWidget();
  }

  //////////////////////////////
  //// Back, Play&Pause, Next, Repeat, Bible  -- Widget
  /////////////////////////////
  Widget loadAssets() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // btnRepeat(),
        btnMoveToPrevious(),
        btnPlayStart(),
        btnMoveToNext(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var audioProvider =
        Provider.of<AudioPlayerProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        audioProvider.initStateAction(
            'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3');

        // audioProvider.stopAudioPlaying();
      },
    );

    var position = audioProvider.position;
    var duration = audioProvider.duration;

    return widget.isSmallScreen

        /////////////////////////////
        ////// Small Container Controller
        //////////////////////////
        ? Container(
            child: btnPlayStart(),
          )

        /////////////////////////////
        ////// Big Container Controller
        //////////////////////////
        : Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      position.toString().split(".")[0],
                      // style: kCountDownTextStyle
                    ),
                    Text(
                      duration.toString().split(".")[0],
                    ),
                  ],
                ),
              ),
              sliderWidget(),
              loadAssets(),
            ],
          );
  }
}
