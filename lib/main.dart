import 'package:flutter/material.dart';
import 'package:spotify/screens/account.dart';
// import 'package:spotify_sdk/spotify_sdk.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // try {
  // await SpotifySdk.connectToSpotifyRemote(
  //     clientId: '02ebb5c2e7c642c38e30cc48c30470ec',
  //     redirectUrl: 'com.example.spotify://callback');
  // } catch (e) {
  //   print(e);
  // }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.black45),
      home: const UserAccount(),
    );
  }
}
