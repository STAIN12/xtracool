import 'package:flutter/material.dart';
import 'package:socool/widgets/chart_card.dart';

import '../constants/text_styles.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({super.key});

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Charts",
          style: kTextStyleSize16,
        ),
      ),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: ((context, index) {
          return ChartTwoCard();
        }),
      ),
    );
  }
}
