import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socool/providers/audio_player_provider.dart';
import 'package:socool/providers/network_provider.dart';
import 'package:socool/screens/feed_screen.dart';
import 'package:socool/screens/no_internet_screen.dart';
import 'package:socool/screens/profile_screen.dart';
import 'package:socool/screens/small_player_screen.dart';

import 'screens/search_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // int? feedIndex;
  List screenList = [
    const FeedScreen(),
    const SearchScreen(),
    const ProfileScreen()
  ];

  int screenIndex = 0;

  changeScreenIndex(int index) {
    setState(() {
      screenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var networkStatus = Provider.of<NetworkStatus>(context);

    networkStatus.checkInternetConnection();

    return networkStatus.hasInternet
        ? Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: screenList[screenIndex],
                ),

                /////////////////////////
                ///// Show if any audio is set to play
                /////////////////////////////////////
                Provider.of<AudioPlayerProvider>(context).audioFileSet
                    ? const SmallPlayerScreen()
                    : const SizedBox.shrink()
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    screenIndex == 0
                        ? Icons.audiotrack
                        : Icons.audiotrack_outlined,
                  ),
                  label: 'Discovery',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    screenIndex == 1 ? Icons.search : Icons.search_outlined,
                  ),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    screenIndex == 2 ? Icons.person : Icons.person_outline,
                  ),
                  label: 'Profile',
                ),
              ],
              onTap: changeScreenIndex,
              currentIndex: screenIndex,
            ),
          )
        : NoInternetScreen();
  }
}
