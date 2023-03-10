import 'package:flutter/material.dart';

import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: MyOtherPage(),
        ),
      ),
    );
  }
}

class MyOtherPage extends StatefulWidget {
  const MyOtherPage({Key? key}) : super(key: key);

  @override
  State<MyOtherPage> createState() => _MyOtherPageState();
}

class _MyOtherPageState extends State<MyOtherPage> {
  void playSound(Source what) async {
    final player = AudioPlayer();
    await player.play(what);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: TextButton(
            // style: TextButton.styleFrom(padding: EdgeInsets.zero),
            onPressed: () =>
                playSound(AssetSource('01176-wooden-windbells-on-wind-8.wav')),
            child: Container(
              // width: 300,
              color: Colors.lightBlue,
              child: Center(
                child: Text(
                  'Chimes',
                  style: TextStyle(color: Colors.blue.shade900),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: TextButton(
            // style: TextButton.styleFrom(padding: EdgeInsets.zero),
            onPressed: () {
              // playSound(UrlSource('https://freesound.org/s/416529/'));
              playSound(AssetSource(
                  '416529__inspectorj__bird-whistling-single-robin-a.wav'));
            },
            child: Container(
              // width: 300,
              color: Colors.lightGreen,
              child: Center(
                child: Text(
                  'Robin chirp',
                  style: TextStyle(color: Colors.blue.shade900),
                ),
              ),
            ),
          ),
        ),
        const Expanded(
          flex: 7,
          child: MyHomePage(),
        ),
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List myColors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.teal,
    Colors.blue,
    Colors.purple
  ];

  void playNote(int index) async {
    final player = AudioPlayer();
    await player.play(AssetSource('note$index.wav'));
  }

  Widget aKey(int index) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        onPressed: () => playNote(index + 1),
        child: Container(
          color: myColors[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        for (var i = 0; i < 7; i++) aKey(i),
      ],
    );
  }
}
