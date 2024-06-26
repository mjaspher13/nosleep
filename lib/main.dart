import 'package:flutter/material.dart';
import 'no_sleep.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final SleepPrevention _sleepPrevention = SleepPrevention();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('No Sleep App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  _sleepPrevention.preventSleep();
                },
                child: Text('Prevent Sleep'),
              ),
              ElevatedButton(
                onPressed: () {
                  _sleepPrevention.allowSleep();
                },
                child: Text('Allow Sleep'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
