import 'package:flutter/material.dart';

class FastCounter extends StatelessWidget {
  final int endValue; // The value to count up to
  final Duration duration; // The duration of the animation

  const FastCounter({
    super.key,
    required this.endValue,
    this.duration = const Duration(seconds: 3), // Default duration: 3 seconds
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TweenAnimationBuilder<int>(
        tween: IntTween(begin: 0, end: endValue),
        duration: duration,
        builder: (context, value, child) {
          return Text(
            value.toString(),
            style: const TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          );
        },
      ),
    );
  }
}


