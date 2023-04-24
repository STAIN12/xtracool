import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/color.dart';
import '../constants/constant.dart';
import '../constants/text_styles.dart';
import '../providers/audio_player_provider.dart';
import '../widgets/audio_card.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/playlist_card.dart';

class NoInternetScreen extends StatelessWidget {
  NoInternetScreen({Key? key}) : super(key: key);

  // final VoidCallback onPressAction;

  @override
  Widget build(BuildContext context) {
    var audio = Provider.of<AudioPlayerProvider>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: kSecondaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(100),
                ),
              ),
              child: const Icon(
                Icons.wifi_off,
                size: 90,
                color: Colors.white,
              ),
            ),
            kSizedBoxHeight10,
            Text(
              'No internet',
              style: kHeaderTextStyle.copyWith(color: Colors.black),
            ),
            kSizedBoxHeight15,
            const CircularProgressIndicator(
              color: kYellowPrimaryColor,
              strokeWidth: 5,
            ),
          ],
        ),
      ),
    );
  }
}
