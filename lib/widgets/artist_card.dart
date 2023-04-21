import 'package:flutter/material.dart';

class ArtistCard extends StatelessWidget {
  const ArtistCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.red,
          ),
          Text("Black Sherif")
        ],
      ),
    );
  }
}
