import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/color.dart';
import '../constants/constant.dart';
import '../constants/text_styles.dart';
import '../providers/audio_player_provider.dart';

class AudioPlayerController extends StatefulWidget {
  const AudioPlayerController(
      {Key? key, this.isSmallScreen = false})
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
    var audioProvider = Provider.of<AudioPlayerProvider>(context);
    return Provider.of<AudioPlayerProvider>(context)
        .isPlayingIcons(context, audioProvider.currentAudioDetail["audio_path"]);
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
        color: kPrimaryColor,
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
        color: kPrimaryColor,
      ),
      onPressed: () {},
    );
  }

  //////////////////////////////////
  //// Repeat audio btn
  //////////////////////////////////
  Widget btnRepeat() {
    return IconButton(
      splashRadius: 0.2,
      icon: const Icon(
        Icons.repeat,
        size: kIconSize20,
        color: kPrimaryColor,
      ),
      onPressed: () {},
    );
  }

  //////////////////////////////////
  //// show bible quotations button
  //////////////////////////////////
  Widget showBibleQuotation() {
    return IconButton(
      splashRadius: 0.2,
      icon: const Icon(
        Icons.menu_book_sharp,
        size: kIconSize20,
        color: kPrimaryColor,
      ),
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(10),
            ),
          ),
          context: context,
          builder: (context) {
            return Container(
              height: MediaQuery.of(context).size.height / 2,
              decoration: const BoxDecoration(
                color: kSecondaryColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
              ),
              width: 300,
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '77 Quotations from preaching ',
                    style:
                        kTextStyleSize9.copyWith(fontWeight: FontWeight.bold),
                  ),
                  // SizedBox(height: 20,),
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                child: const Text(
                                  "Genesis 1:4",
                                  style: kTextStyleSize8,
                                ),
                              ),
                              // Container(
                              //   padding: EdgeInsets.all(5),
                              //   child: Text("John 1:4"),
                              // ),
                            ],
                          );
                        }),
                  )
                ],
              ),
            );
          },
        );
      },
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
        btnRepeat(),
        btnMoveToPrevious(),
        btnPlayStart(),
        btnMoveToNext(),
        showBibleQuotation(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var audioProvider =
        Provider.of<AudioPlayerProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        audioProvider.initStateAction(audioProvider.currentAudioDetail["audio_path"]);

        // audioProvider.stopAudioPlaying();
        // audioProvider.getAudioPath(localPath);
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
