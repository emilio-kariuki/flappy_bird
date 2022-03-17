import 'dart:async';

import 'package:flappy_bird/Bird.dart';
import 'package:flappy_bird/barrier.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  double barrierXOne = 0;
  double barrierXTwo = 1;

  void jump() {
    setState(() {
      time = 0;
      initialHeight = birdLocation;
    });
  }

  void startGame() {
    hasStarted = true;
    Timer.periodic(Duration(milliseconds: 50), (timer) {
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
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
      children: [
        Expanded(
            flex: 2,
            child: Stack(
              children: [
                GestureDetector(
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
                      color: Color.fromARGB(255, 17, 139, 240)),
                ),
                Container(
                  alignment: Alignment(0, -0.3),
                  child: hasStarted
                      ? Text(" ")
                      : Text("  T A P  T O  P L A Y ",
                          style: GoogleFonts.redressed(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w600)),
                ),
                AnimatedContainer(
                  alignment: Alignment(barrierXOne, 1.1),
                  duration: Duration(milliseconds: 0),
                  child: Barrier(size: 200),
                ),
                AnimatedContainer(
                  alignment: Alignment(barrierXOne, -1.1),
                  duration: Duration(milliseconds: 0),
                  child: Barrier(size: 200),
                ),
                AnimatedContainer(
                  alignment: Alignment(barrierXTwo, -1.1),
                  duration: Duration(milliseconds: 0),
                  child: Barrier(size: 150),
                ),
                AnimatedContainer(
                  alignment: Alignment(barrierXTwo, 1.1),
                  duration: Duration(milliseconds: 0),
                  child: Barrier(size: 250),
                )
              ],
            )),
        Container(
          height: 15,
          color: Colors.green,
        ),
        Expanded(
          child: Container(
              //padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Padding(
                padding: const EdgeInsets.all(100.0),
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text("Score",
                            style: GoogleFonts.roboto(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.w500)),
                        Text("0",
                            style: GoogleFonts.roboto(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                    SizedBox(
                      width: size.width * 0.1,
                    ),
                    Column(
                      children: [
                        Text("Best",
                            style: GoogleFonts.roboto(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.w500)),
                        Text("0",
                            style: GoogleFonts.roboto(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ],
                ),
              ),
              color: Color.fromARGB(255, 172, 121, 10)),
        )
      ],
    ));
  }
}
