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
  Duration _duration = new Duration(seconds: (10));

  int _counter = (10);
  Timer _timer;
  String showtime = "10 Seconds Countdown";
  bool _isbuttondisabled = false;
  void startTimer() {
    _counter = (10);

    _timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        if (_counter > 0) {
          setState(() {
            _isbuttondisabled = true;
            _counter--;
            _duration = new Duration(seconds: _counter);
            showtime = "${_duration.inMinutes}:${_duration.inSeconds % 60}";
            print("${_duration.inMinutes}:${_duration.inSeconds % 60} ");
          });
        } else {
          _timer.cancel();
          setState(() {
            _isbuttondisabled = false;
          });
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
            _counter > 0 ? Text("") : callbackfunction(),
            Text(
              "$showtime",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            RaisedButton(
              elevation: 10,
              onPressed: _isbuttondisabled == false ? startTimer : null,
              child: Text("Start Timer"),
            )
          ],
        ),
      ),
    );
  }
}

Widget callbackfunction() {
  return Center(
    child: Text(
      "Timer Completed",
      style: TextStyle(
          fontSize: 25, fontWeight: FontWeight.bold, color: Colors.green),
    ),
  );
}
