import 'package:flutter/material.dart';

class StackPage extends StatelessWidget {
  const StackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Widget position'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const SizedBox(
        height: 50.0,
        width: double.infinity,
        child: Stack(
          children: [],
        ),
      ),
    );
  }
}
