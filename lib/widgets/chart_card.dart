import 'package:flutter/material.dart';
import 'package:socool/constants/color.dart';

import '../constants/constant.dart';
import '../constants/text_styles.dart';

class ChartTwoCard extends StatelessWidget {
  const ChartTwoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ChartCard(),
        kSizedBoxWidth10,
        ChartCard(),
      ],
    );
  }
}

class ChartCard extends StatelessWidget {
  const ChartCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: kPrimaryColorTwo,
          borderRadius: BorderRadius.circular(7),
        ),
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                image: kDefaultAudioImage,
              ),
            ),
            kSizedBoxHeight10,
            Text(
              "Kweku the Traveller Kweku the Traveller",
              overflow: TextOverflow.ellipsis,
              style: kTextStyleSize15,
              textAlign: TextAlign.center,
            ),
            Text(
              "Black Sheriff dddddd ddddd fhgrg erer",
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: kTextStyleSize12,
            )
          ],
        ),
      ),
    );
  }
}
