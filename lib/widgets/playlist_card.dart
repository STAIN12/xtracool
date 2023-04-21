import 'package:flutter/material.dart';

import '../constants/color.dart';
import '../constants/constant.dart';
import '../constants/text_styles.dart';
import 'audio_container_image.dart';

class PlayListCard extends StatelessWidget {
  const PlayListCard({
    Key? key,
    // required this.playList,
  }) : super(key: key);

  // final List playList;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      // padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          const AudioImageContainer(
            imageWidth: 150,
            imageHeight: 150,
          ),
          kSizedBoxWidth15,
          Container(
            width: 80,
            height: 150,
            child: Text(
              "What does the bible says. What does the bible says What does the bible says. What does the bible says. What does the bible says What does the bible says. What does the bible says. What does the bible says What does the bible says. What does the bible says. What does the bible says What does the bible says.",
              overflow: TextOverflow.visible,
              style: kTextStyleSize8.copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
