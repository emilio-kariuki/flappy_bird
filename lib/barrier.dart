// ignore_for_file: prefer_typing_uninitialized_variables

import "package:flutter/material.dart";

class Barrier extends StatelessWidget {
  final barrierWidth;
  final barrierHeight;
  final barrierX;
  final bool isBottomBarrier;
  const Barrier({
    Key? key,
    this.barrierWidth,
    this.barrierHeight,
    this.barrierX,
    required this.isBottomBarrier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: Duration(milliseconds: 0),
      
        alignment: Alignment((2 ) / (2 - barrierWidth),
            isBottomBarrier ? 1 : -1),
        child: Container(
          color: Colors.green,
          width: MediaQuery.of(context).size.width * barrierWidth / 2,
          height: MediaQuery.of(context).size.height * 3 / 4 * barrierHeight / 2,
        ));
  }
}
