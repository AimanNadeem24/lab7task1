import 'package:flutter/material.dart';

void main() {
  runApp(AimyTimer());
}

class AimyTimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TimerPage(),
    );
  }
}

class TimerPage extends StatefulWidget {
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  int _counter = 10;
  bool _isRunning = false;

  void _startTimer() {
    if (_isRunning) return;
    setState(() {
      _isRunning = true;
    });
    _decrementCounter();
  }

  void _stopTimer() {
    setState(() {
      _isRunning = false;
    });
  }

  void _decrementCounter() {
    if (_counter > 0 && _isRunning) {
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          _counter--;
        });
        _decrementCounter();
      });
    } else {
      setState(() {
        _isRunning = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Girlies Timer')),
        backgroundColor: const Color.fromARGB(255, 162, 236, 214),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(255, 162, 236, 214),
              const Color.fromARGB(255, 165, 113, 214)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Countdown: $_counter',
                style: TextStyle(
                    fontSize: 48, color: const Color.fromARGB(255, 68, 56, 68)),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _startTimer,
                child: Text('Start Timer'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 210, 214, 218),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _stopTimer,
                child: Text('Stop Timer'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 210, 214, 218),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
