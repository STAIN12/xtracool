import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/color.dart';
import '../constants/constant.dart';
import '../constants/text_styles.dart';
import '../providers/audio_player_provider.dart';
import '../screens/player_screen.dart';
import '../utils/custom_page_route.dart';
import 'audio_container_image.dart';

class AudioCard extends StatelessWidget {
  const AudioCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xff2C2C2C)),
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(8),
        leading: const AudioImageContainer(
          imageHeight: 90,
          imageWidth: 80,
        ),
        title: Text(
          'Kweku the traveller',
          overflow: TextOverflow.ellipsis,
          style: kTextStyleSize10.copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          'Black Sherif',
          style: kAudioCardSubtitleTextStyle,
        ),
        onTap: () {
          /// Stop any audio playing and set new audio file

          // Provider.of<AudioPlayerProvider>(context, listen: false)
          //     .currentAudioPlaying(audioDetail["title"]);

          // Provider.of<AudioPlayerProvider>(context, listen: false)
          //     .currentAudioPlayingId = audioDetail["title"];

          // Provider.of<AudioPlayerProvider>(context, listen: false)
          //     .currentAudioIndex = audioIndex;
          // // Provider.of<AudioPlayerProvider>(context,listen: false).stopAudioPlaying();

          //  Provider.of<AudioPlayerProvider>(context, listen: false)
          //     .updateCurrentAudioDetail(audioDetail);

          Navigator.of(context).push(
            CustomPageRoute(
              child: const PlayerScreen(),
              direction: AxisDirection.up,
            ),
          );
        },
      ),
    );
  }
}

// GestureDetector(
// onTap: () => Navigator.of(context).push(
// CustomPageRoute(child: PlayerScreen(), direction: AxisDirection.up),
// ),
// child: Container(
// padding: const EdgeInsets.all(10),
// decoration: BoxDecoration(
// border: Border(
// bottom: BorderSide(color: kGreyColor),
// ),
// ),
// // height: 90,
// child: Row(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// const AudioImageContainer(imageWidth: 98, imageHeight: 90),
// kSizedBoxWidth15,
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Container(
// width: MediaQuery.of(context).size.width * 0.7,
// child: Text(
// 'What does the bible say What does the bible say',
// overflow: TextOverflow.ellipsis,
// style:
// kTextStyleSize8.copyWith(fontWeight: FontWeight.bold),
// ),
// ),
// kSizedBoxWidth15,
// Row(
// children: [
// Text('❤ 200k', style: kAudioCardSubtitleTextStyle),
// SizedBox(
// width: 10,
// ),
// Text(
// '🎧 200k',
// style: kAudioCardSubtitleTextStyle,
// )
// ],
// ),
// ],
// )
// ],
// ),
// ),
// );
