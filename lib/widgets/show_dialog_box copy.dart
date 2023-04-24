import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socool/constants/text_styles.dart';
import 'package:socool/home_page.dart';
import 'package:socool/providers/audio_player_provider.dart';
import 'package:socool/screens/login_screen.dart';

class ShowDialogContainer extends StatelessWidget {
  const ShowDialogContainer({super.key});

  @override
  Widget build(BuildContext context) {
    AudioPlayerProvider audioPlayerProvider = Provider.of(context);
    return Platform.isIOS
        ? CupertinoAlertDialog(
            title: Text(
              'Create an account or Log in',
              style: kTextStyleSize18.copyWith(fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
            content: const Text(
              "To get the most out of your experience, we recommend creating an account or logging in.",
              textAlign: TextAlign.center,
              style: kTextStyleSize15,
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                ),
                child: const Text(
                  'Cancel',
                  style: kTextStyleSize12,
                ),
              ),
              TextButton(
                onPressed: () {
                  audioPlayerProvider.stopAudioPlaying();

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                child: const Text(
                  'OK',
                  style: kTextStyleSize12,
                ),
              ),
            ],
          )
        : AlertDialog(
            title: Text(
              'Create an account or Log in',
              style: kTextStyleSize18.copyWith(fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
            content: const Text(
              "To get the most out of your experience, we recommend creating an account or logging in.",
              textAlign: TextAlign.center,
              style: kTextStyleSize15,
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                ),
                child: const Text(
                  'Cancel',
                  style: kTextStyleSize12,
                ),
              ),
              TextButton(
                onPressed: () {
                  audioPlayerProvider.stopAudioPlaying();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                child: const Text(
                  'OK',
                  style: kTextStyleSize12,
                ),
              ),
            ],
          );
  }
}

void showProfileDialogBox({required BuildContext context}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => const ShowDialogContainer(),
  );
}
