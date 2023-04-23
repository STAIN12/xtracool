import 'package:flutter/material.dart';

import '../constants/color.dart';
import '../constants/text_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.labelString,
    required this.onPressAction,
    this.isLoading = false,
  }) : super(key: key);

  final String labelString;
  final VoidCallback onPressAction;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        backgroundColor: kYellowPrimaryColor,
      ),
      onPressed: onPressAction,
      child: isLoading
          ? const SizedBox(
              width: 25,
              height: 25,
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            )
          : Text(
              labelString,
              style: kTextStyleSize15.copyWith(fontWeight: FontWeight.bold),
            ),
    );
  }
}
