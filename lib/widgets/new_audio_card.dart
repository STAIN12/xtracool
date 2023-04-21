import 'package:flutter/material.dart';

import '../constants/color.dart';
import '../constants/constant.dart';
import '../constants/text_styles.dart';
import 'audio_container_image.dart';

class NewAudioCard extends StatelessWidget {
  const NewAudioCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 300,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const AudioImageContainer(
            imageWidth: 70,
            imageHeight: 70,
          ),
          kSizedBoxWidth15,
          Container(
            width: 180,
            child: Text(
              "What does the bible says. What does the bible says What does the bible says. What does the bible says. What does the bible says What does the bible says.",
              overflow: TextOverflow.visible,
              style: kTextStyleSize8.copyWith(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
