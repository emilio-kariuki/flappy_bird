import 'package:flutter/material.dart';

class Bird extends StatelessWidget {
  final birdY;
  final double birdWidth;
  final double birdHeight;
  const Bird(
      {Key? key, required this.birdWidth, required this.birdHeight, this.birdY})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        alignment:
            Alignment(0, (2 * (2 * birdY + birdHeight) / (2 - birdHeight))),
        child: Image.asset('assets/flappy.png',
            height: size.height * 3 / 4 * birdHeight / 2,
            width: size.height * birdWidth / 2,
            fit: BoxFit.fill));
  }
}
