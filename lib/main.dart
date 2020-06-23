import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Duration _duration = new Duration(seconds: 120);

  int _counter = 120;
  Timer _timer;
  String showtime;
  void startTimer() {
    _counter = 120;

    _timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        if (_counter > 0) {
          setState(() {
            _counter--;
            _duration = new Duration(seconds: _counter);
            showtime = "${_duration.inMinutes} : ${_duration.inSeconds % 60}";
            print("${_duration.inMinutes} : ${_duration.inSeconds % 60} ");
          });
        } else {
          _timer.cancel();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Timer Tutorial"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _counter > 0
                ? Text("")
                : Text(
                    "Done",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
            Text(
              "$showtime",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            RaisedButton(
              onPressed: () => startTimer(),
              child: Text("Start Timer"),
            )
          ],
        ),
      ),
    );
  }
}
