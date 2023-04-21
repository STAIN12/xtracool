import 'package:flutter/material.dart';

import '../constants/text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onTapAction,
  }) : super(key: key);
  final VoidCallback onTapAction;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTapAction,
      child: Container(
        height: 50,
        width: screenWidth,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "images/google.png",
              scale: 100,
            ),
            Text(
              "Continue with Google",
              style: kTextStyleSize8.copyWith(fontWeight: FontWeight.w900),
            ),
          ],
        ),
      ),
    );
  }
}
