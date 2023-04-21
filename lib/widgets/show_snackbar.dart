import 'package:flutter/material.dart';

showSnackBar(String text, Color backgroundColor, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: backgroundColor,
      content: Text(
        text,
        // style: kTextStyleSize9,
      ),
    ),
  );
}
