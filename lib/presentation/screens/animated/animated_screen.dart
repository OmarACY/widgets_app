import 'package:flutter/material.dart';

class AnimatedScreen extends StatelessWidget {

  static const String name = 'animated_screen';

  const AnimatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          curve: Curves.easeInCubic,
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(30),
          )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        child: const Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}