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
  double birdWidth = 0.1;
  double birdHeight = 0.1;
  static double barrierXOne = 1;
  double barrierXTwo = barrierXOne + 1.5;

  static List<double> barrierX = [2, 3.5];
  static double barrierWidth = 0.5;
  List<List<double>> barrierHeight = [
    [0.6, 0.4],
    [0.4, 0.6]
  ];

  bool birdIsDead() {
    if (birdLocation > 1 || birdLocation < -1) {
      return true;
    }
    for (int t = 0; t < barrierX.length; t++) {
      if (barrierX[t] <= birdWidth &&
          barrierX[t] + barrierWidth >= -birdWidth &&
          (birdLocation <= -1 + barrierHeight[t][0] ||
              birdLocation + birdHeight >= 1 - barrierHeight[t][1])) {
        return true;
      }
    }
    return false;
  }

  void startGame() {
    hasStarted = true;
    Timer.periodic(Duration(milliseconds: 50), (timer) {
       time += 0.03;
      height = -4.9 * time * time + 2 * time;
      setState(() {
        birdLocation = initialHeight - height;
      });
      if (birdIsDead()) {
        timer.cancel();
        hasStarted = false;
        showingDialog();
      }
    });
  }

  void jump() {
    setState(() {
      time = 0;
      initialHeight = birdLocation;
    });
  }

  void resetGame() {
    Navigator.pop(context);
    setState(() {
      birdLocation = 0;
      hasStarted = false;
      time = 0;
      initialHeight = birdLocation;
    });
  }

  void showingDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Color.fromARGB(255, 172, 121, 10),
            title: Center(
              child: Text("Game Over", style: TextStyle(color: Colors.white)),
            ),
            actions: [
              GestureDetector(
                  onTap: resetGame,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        padding: EdgeInsets.all(8),
                        color: Colors.white,
                        child: Text("Play Again",
                            style: TextStyle(color: Colors.orange)),
                      )))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: hasStarted ? jump : startGame,
      child: Scaffold(
          body: Column(
        children: [
          Expanded(
              flex: 3,
              child: Container(
                color: Colors.blue,
                child: Stack(
                  children: [
                    Bird(
                      birdHeight: birdHeight,
                      birdWidth: birdWidth,
                      birdY: birdLocation,
                    ),
                    // Container(
                    //   alignment: Alignment(0, -0.3),
                    //   child: hasStarted
                    //       ? Text(" ")
                    //       : Text("  T A P  T O  P L A Y ",
                    //           style: GoogleFonts.redressed(
                    //               fontSize: 25,
                    //               color: Colors.white,
                    //               fontWeight: FontWeight.w600)),
                    // ),
                    Barrier(
                      barrierX: barrierX[0],
                      barrierWidth: barrierWidth,
                      barrierHeight: barrierHeight[0][0],
                      isBottomBarrier: false,
                    ),
                    Barrier(
                      barrierX: barrierX[0],
                      barrierWidth: barrierWidth,
                      barrierHeight: barrierHeight[0][1],
                      isBottomBarrier: true,
                    ),
                    Barrier(
                      barrierX: barrierX[1],
                      barrierWidth: barrierWidth,
                      barrierHeight: barrierHeight[1][0],
                      isBottomBarrier: false,
                    ),
                    Barrier(
                      barrierX: barrierX[1],
                      barrierWidth: barrierWidth,
                      barrierHeight: barrierHeight[1][1],
                      isBottomBarrier: true,
                    )
                  ],
                ),
              )),
          // Container(
          //   height: 15,
          //   color: Colors.green,
          // ),
          Expanded(
            child: Container(
                //padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left : 60),
                  child: Row(
                    children: [
                      Text("Made By Emilio ",
                          style: GoogleFonts.roboto(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
                color: Color.fromARGB(255, 172, 121, 10)),
          )
        ],
      )),
    );
  }
}
