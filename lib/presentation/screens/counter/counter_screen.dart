import 'package:flutter/material.dart';

class CounterScreen extends StatelessWidget {

  static const String name = 'counter_screen';

  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter Screen')),
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text('0', style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
      ),
      floatingActionButton: const FloatingActionButton(onPressed: null, child: Icon(Icons.add)),
    );
  }
}