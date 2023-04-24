import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socool/providers/audio_player_provider.dart';
import 'package:socool/widgets/chart_card.dart';

import '../api_service/api.dart';
import '../constants/text_styles.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({super.key});

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  @override
  Widget build(BuildContext context) {
    AudioPlayerProvider audioPlayerProvider = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Charts",
          style: kTextStyleSize16,
        ),
      ),
      body: ListView.builder(
        itemCount: audioPlayerProvider.chartTracks.length,
        itemBuilder: (context, index) {

          // print(
          //     "object ${audioPlayerProvider.chartTracks[20]['images']['background']}");
          return ChartCard(

            audioData: audioPlayerProvider.chartTracks[index],
          );
        },
      ),
    );
  }
}
