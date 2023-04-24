import 'package:flutter/material.dart';

import '../constants/color.dart';
import '../constants/constant.dart';

class AudioImageContainer extends StatelessWidget {
  const AudioImageContainer({
    Key? key,
    required this.imageWidth,
    required this.imageHeight,
    required this.audioImgURL,
  }) : super(key: key);

  final double imageWidth;
  final double imageHeight;
  final String audioImgURL;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: imageWidth,
      height: imageHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kPrimaryColor,
        image: DecorationImage(
            image: NetworkImage(audioImgURL), fit: BoxFit.cover),
      ),
    );
  }
}
