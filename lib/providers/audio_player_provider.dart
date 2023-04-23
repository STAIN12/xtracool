import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import '../constants/color.dart';
import '../constants/constant.dart';

class AudioPlayerProvider extends ChangeNotifier {
  final AudioPlayer audioPlayer = AudioPlayer();

  bool isLoadingAudioFile = false;

  bool btnIsPlaying = false;
  bool audioFileSet = false;
  double minAudioPlayPositioned = 0.0;

  String currentAudioPlayingId = " ";
  int currentAudioIndex = 0;

  Duration _duration = const Duration();
  Duration _position = const Duration();

  // final String onlinePath =
  //     "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3";

  // ignore: prefer_typing_uninitialized_variables
  var currentAudioDetail;

  void updateCurrentAudioDetail(newAudioDetail) {
    currentAudioDetail = newAudioDetail;
  }

  get duration {
    return _duration;
  }

  get position {
    return _position;
  }

  void waitForAudiFile() {
    isLoadingAudioFile = !isLoadingAudioFile;
    notifyListeners();
  }

  // int screenIndex = 0;

  List<IconData> btnStartPauseIcon = [
    Icons.play_circle,
    Icons.pause_circle_filled
  ];

  Widget isPlayingIcons(context, audioPath) {
    return IconButton(
      splashRadius: 0.2,
      icon: btnIsPlaying
          ? Icon(
              btnStartPauseIcon[1],
              size: kIconSize35,
              color: kYellowPrimaryColor,
            )
          : Icon(
              btnStartPauseIcon[0],
              size: kIconSize35,
              color: kYellowPrimaryColor,
            ),
      onPressed: () async {
        /////////////////////
        ////// Change Icon button widget
        btnIsPlaying ? btnIsPlaying = false : btnIsPlaying = true;

        ///////////////////////
        //// Make Small player container appear once an audio is playing
        audioFileSetAction();

        /////////////////////
        ////// Play or pause audio
        btnIsPlaying
            ? await audioPlayer.play(UrlSource(audioPath))
            : audioPlayer.pause();

        notifyListeners();
      },
    );
  }

  Widget sliderWidget() {
    return Slider(
      max: _duration.inSeconds.toDouble(),
      value: _position.inSeconds.toDouble(),
      min: minAudioPlayPositioned,
      activeColor: kYellowPrimaryColor,
      inactiveColor: kPrimaryColor,
      onChanged: (double value) {
        changeToSecond(value.toInt());
        value = value;
        notifyListeners();
      },
    );
  }

  void btnIsPlayingAction() {
    btnIsPlaying = !btnIsPlaying;
    notifyListeners();
  }

  void audioFileSetAction() {
    audioFileSet = true;
    notifyListeners();
  }

  void currentAudioPlaying(newAudioId) {
    newAudioId != currentAudioPlayingId ? stopAudioPlaying() : null;

    notifyListeners();
  }

  Future<void> initStateAction(String audioPath) async {
    waitForAudiFile();

    try {
      audioPlayer.onDurationChanged.listen((dur) {
        _duration = dur;
        notifyListeners();
      });

      audioPlayer.onPositionChanged.listen((pos) {
        _position = pos;
        notifyListeners();
      });

      audioPlayer.onPlayerComplete.listen(
        (comp) {
          _position = const Duration(seconds: 0);

          btnIsPlaying = false;

          notifyListeners();
        },
      );

      if (audioPath.contains("https")) {
        await audioPlayer.setSourceUrl(audioPath);
      } else {
        await audioPlayer.setSource(
          AssetSource(audioPath),
        );
      }

      waitForAudiFile();
    } catch (err) {
      print("There is an error at initStateAction");
      rethrow;
      // waitForAudiFile();
    }

    notifyListeners();
  }

  void changeToSecond(int seconds) {
    Duration duration = Duration(seconds: seconds);
    audioPlayer.seek(duration);
  }

  void stopAudioPlaying() {
    btnIsPlaying ? audioPlayer.stop() : null;

    btnIsPlaying = false;

    _position = const Duration(seconds: 0);
    // minAudioPlayPositioned = 0.0;

    notifyListeners();
  }

  /////////////////////////////////////////////
  //////////////// Downloads //////////////////
  /////////////////////////////////////////////
}
