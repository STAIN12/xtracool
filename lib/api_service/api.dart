import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:socool/providers/audio_player_provider.dart';

class AudioAPI {
  ////////////////////////////////////////////////////////////
  ///
  ////////////////////////////////////////////////////
  ///

  Future getCharts(context) async {
    AudioPlayerProvider audioPlayerProvider =
        Provider.of(context, listen: false);
    try {
      var response = await http.get(
          Uri.parse(
            "${dotenv.get("BASE_URL_V1")}/charts/country?country_code=GH",
          ),
          headers: {
            'X-RapidAPI-Key': dotenv.get("RapidAPI_Key"),
            'X-RapidAPI-Host': dotenv.get("RapidAPI_Host")
          });

      var jsonRespond = jsonDecode(response.body);

      audioPlayerProvider.getChartTracks(jsonRespond);

      audioPlayerProvider.updateChartTrackStatus();

      print("Yes yes yes yes");


      print("audioPlayerProvider.isChartTracksReady ${audioPlayerProvider.isChartTracksReady}");

      // print("JsonRes ${jsonRespond[49]['subtitle']}");
      // return jsonRespond;
    } catch (e) {
      print("Charts Error here ------------");
      rethrow;
    }
  }
}
