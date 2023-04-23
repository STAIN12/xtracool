import 'package:flutter/material.dart';
import 'package:socool/constants/text_styles.dart';
import 'package:socool/widgets/audio_card.dart';

class AroundYouScreen extends StatefulWidget {
  const AroundYouScreen({super.key});

  @override
  State<AroundYouScreen> createState() => _AroundYouScreenState();
}

class _AroundYouScreenState extends State<AroundYouScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Around you',
          style: kTextStyleSize16,
        ),
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return AudioCard();
          }),
    );
  }
}
