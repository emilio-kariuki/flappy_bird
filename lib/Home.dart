import 'dart:async';

import 'package:flappy_bird/Bird.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double birdLocation = 0;

  void jump() {
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      
    });
  }

  // @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Expanded(
          flex: 2,
          child: GestureDetector(
            onTap: jump,
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
