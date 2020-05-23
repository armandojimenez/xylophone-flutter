import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatefulWidget {
  @override
  _XylophoneAppState createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {
  Color currentColor = Colors.black;

  Expanded buildXylophoneKey({Color color, int position}) => Expanded(
        child: FlatButton(
          child: Container(),
          color: color,
          onPressed: () {
            final player = AudioCache();
            player.play('note$position.wav');
            setState(() {
              currentColor = color;
            });
          },
        ),
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.grey[200],
          title: Text(
            'Xylophone',
            style: TextStyle(
                color: currentColor, fontFamily: 'Galaga', fontSize: 25),
          ),
        ),
        body: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildXylophoneKey(color: Colors.teal, position: 1),
              buildXylophoneKey(color: Colors.red, position: 2),
              buildXylophoneKey(color: Colors.yellow, position: 3),
              buildXylophoneKey(color: Colors.purple, position: 4),
              buildXylophoneKey(color: Colors.pink, position: 5),
              buildXylophoneKey(color: Colors.deepPurple, position: 6),
              buildXylophoneKey(color: Colors.orange, position: 7),
            ],
          ),
        ),
      ),
    );
  }
}
