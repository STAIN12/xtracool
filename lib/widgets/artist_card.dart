import 'package:flutter/material.dart';
import 'package:socool/constants/text_styles.dart';

class ArtistCard extends StatelessWidget {
  const ArtistCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.red,
          ),
          Text(
            "Black Sherif",
            style: kTextStyleSize12,
          )
        ],
      ),
    );
  }
}
