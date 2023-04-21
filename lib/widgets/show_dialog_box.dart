import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../constants/text_styles.dart';
import '../home_page.dart';
import '../screens/login_screen.dart';

class ShowDialogContainer extends StatelessWidget {
  const ShowDialogContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoAlertDialog(
            title: Text(
              'Create an account or Log in',
              style: kTextStyleSize9.copyWith(fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
            content: const Text(
              "You can enjoy a variety of content. To get the most out of your experience, we recommend creating an account or logging in. This will allow you to download and like content",
              textAlign: TextAlign.center,
              style: kTextStyleSize8,
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
                  style: kTextStyleSize8,
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                ),
                child: const Text(
                  'OK',
                  style: kTextStyleSize8,
                ),
              ),
            ],
          )
        : AlertDialog(
            title: Text(
              'Create an account or Log in',
              style: kTextStyleSize9.copyWith(fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
            content: const Text(
              "You can enjoy a variety of content. To get the most out of your experience, we recommend creating an account or logging in. This will allow you to download and like content",
              textAlign: TextAlign.center,
              style: kTextStyleSize8,
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
                  style: kTextStyleSize8,
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                ),
                child: const Text(
                  'OK',
                  style: kTextStyleSize8,
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
