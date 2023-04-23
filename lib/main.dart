import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socool/providers/audio_player_provider.dart';
import 'package:socool/providers/network_provider.dart';
import 'package:socool/providers/state_provider.dart';
import 'package:socool/utils/my_theme.dart';

import 'home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        ChangeNotifierProvider(
          create: (_) => StateProvider(),
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
