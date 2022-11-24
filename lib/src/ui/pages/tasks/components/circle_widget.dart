import 'package:flutter/material.dart';

class CircleWidget extends StatelessWidget {
  final Color color;

  const CircleWidget({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 23,
      width: 23,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(40),
        border: Border.all(
          color: Colors.black,
          width: 1.5,
        ),
      ),
    );
  }
}
