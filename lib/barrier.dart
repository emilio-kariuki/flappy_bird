import "package:flutter/material.dart";

class Barrier extends StatelessWidget {
  final double size;
  const Barrier({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: size,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(width: 3,color: Color.fromARGB(255, 21, 102, 24))
      )
    );
  }
}
