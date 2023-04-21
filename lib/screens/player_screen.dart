import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import '../constants/color.dart';
import '../constants/constant.dart';
import '../constants/text_styles.dart';
import '../providers/audio_player_provider.dart';
import '../resource/audio_player_controller.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({Key? key}) : super(key: key);


  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  @override
  Widget build(BuildContext context) {
    var audioProvider = Provider.of<AudioPlayerProvider>(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: kWhiteColor,
        leading: IconButton(
            splashRadius: 0.2,
            icon: const RotatedBox(
              quarterTurns: 3,
              child: Icon(
                Icons.arrow_back_ios,
                color: kPrimaryColor,
                size: 18,
              ),
            ),
            onPressed: () => Navigator.of(context).pop()),
        actions: [
          IconButton(
            splashRadius: 0.2,
            icon: const Icon(
              Icons.more_vert,
              color: kPrimaryColor,
              size: 18,
            ),
            onPressed: () {
              //Todo: Share button
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ///////////////////
                // Audio Image
                Container(
                  height: 180,
                  width: 180,
                  decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(color: kSecondaryColor),
                      image: kDefaultAudioImage),
                ),

                //////////////////
                // Audio Title
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Text(
                        audioProvider.currentAudioDetail["title"],
                        overflow: TextOverflow.fade,
                        textAlign: TextAlign.center,
                        style: kTextStyleSize9.copyWith(
                            fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                ),

                //////////////////
                // Share, Download , Like
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      splashRadius: 0.1,
                      onPressed: () {
                        //Todo: Share button to share the audio
                        audioProvider.isLoadingAudioFile;
                      },
                      icon: const Icon(
                        Icons.share,
                        size: kIconSize20,
                        color: kPrimaryColor,
                      ),
                    ),
                    IconButton(
                      splashRadius: 0.1,
                      onPressed: () => downloadFile(
                          url: audioProvider.currentAudioDetail["audio_path"],
                          fileName: audioProvider.currentAudioDetail["title"]),
                      icon: const Icon(Icons.download_outlined,
                          size: kIconSize20, color: kPrimaryColor),
                    ),
                    IconButton(
                      splashRadius: 0.1,
                      onPressed: () {
                        //Todo: like an audio button and save action to LikeScreen
                      },
                      icon: const Icon(
                        Icons.favorite_outline,
                        size: kIconSize20,
                        color: kPrimaryColor,
                      ),
                    ),
                  ],
                ),

                ////////////////////
                // Audio Controllers
                audioProvider.isLoadingAudioFile
                    ? const CircularProgressIndicator(
                        strokeWidth: 20.0,
                        color: kPrimaryColor,
                      )
                    : const AudioPlayerController()
              ],
            ),

            ///////////////////
            ////// Ads Banner
            ///////////////////////////////
            // Positioned(
            //   right: 0,
            //   left: 0,
            //   child: Container(
            //     color: Colors.green,
            //     height: 200,
            //     width: 100,
            //   ),
            // ),

            // Positioned(
            //   right: 0,
            //   left: 0,
            //   child: Container(
            //     color: Colors.green,
            //     height: 80,
            //     width: 100,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  // Future openFile({required String url, required String fileName}) async {
  //   await downloadFile(url, fileName);
  // }

  Future<File?> downloadFile({required String url, required String fileName}) async {
    final appStorage = await getApplicationDocumentsDirectory();

    final file = File("${appStorage.absolute.path}/$fileName");
    print("Location  ::::::::::: ${appStorage.path}/$fileName");

    // try {
    //   final response = await Dio().get(
    //     url,
    //     options: Options(
    //       responseType: ResponseType.bytes,
    //       followRedirects: false,
    //       receiveTimeout: const Duration(seconds: 3),
    //     ),
    //   );
    //
    //   final raf = file.openSync(mode: FileMode.write);
    //   raf.writeFromSync(response.data);
    //
    //   await raf.close();
    //
    //   return file;
    // } catch (e) {
    //   print("Errorrr $e");
    //   return null;
    // }
  }
}
