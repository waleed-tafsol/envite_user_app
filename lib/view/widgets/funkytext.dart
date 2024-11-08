import 'package:flutter/material.dart';

class funkytext extends StatelessWidget {
  const funkytext({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 60,
        fontWeight: FontWeight.bold,
        fontFamily: 'PermanentMarker',
        color: Colors.white,
        shadows: [
          Shadow(
            offset: Offset(2.0, -2.0),
            color: Colors.deepPurple,
            blurRadius: 4.0,
          ),
          Shadow(
            offset: Offset(-8.0, 8.0),
            color: Colors.black,
            blurRadius: 6.0,
          ),
          Shadow(
            offset: Offset(-4.0, 4.0),
            color: Colors.deepPurple,
            blurRadius: 2.0,
          ),
        ],
      ),
    );
  }
}
