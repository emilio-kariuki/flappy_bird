import 'dart:async';

import 'package:flappy_bird/Bird.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static double birdLocation = 0;
  double time = 0;
  double initialHeight = birdLocation;
  double height = 0;
  bool hasStarted = false;

  void jump() {
    setState(() {});
  }

  void startGame() {
    hasStarted = true;
    Timer.periodic(Duration(milliseconds: 500), (timer) {
      time += 0.04;
      height = -4.9 * time * time + 2 * time;
      setState(() {
        birdLocation = initialHeight - height;
      });
      if (birdLocation > 1) {
        timer.cancel();
        hasStarted = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Expanded(
          flex: 2,
          child: GestureDetector(
            onTap: () {
              if (hasStarted) {
                jump();
              } else {
                startGame();
              }
            },
            child: AnimatedContainer(
                duration: Duration(microseconds: 0),
                alignment: Alignment(0, birdLocation),
                child: Bird(),
                color: Color.fromARGB(255, 115, 14, 231)),
          ),
        ),
        Expanded(
          child: Container(color: Color.fromARGB(255, 10, 172, 72)),
        )
      ],
    )));
  }
}
