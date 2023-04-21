import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socool/providers/audio_player_provider.dart';
import 'package:socool/providers/network_provider.dart';
import 'package:socool/utils/my_theme.dart';

import 'home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AudioPlayerProvider>(
          create: (BuildContext context) => AudioPlayerProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => NetworkStatus(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: MyThemeData.darkThemeData,
        home: const HomePage(),
      ),
    );
  }
}
