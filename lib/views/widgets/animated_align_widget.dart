
import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedAlignWidget extends StatefulWidget {
  const AnimatedAlignWidget({super.key});

  @override
  State<AnimatedAlignWidget> createState() => _AnimatedAlignWidgetState();
}

class _AnimatedAlignWidgetState extends State<AnimatedAlignWidget> {
  var _alignment = Alignment.center;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animated Align")),
      body: AnimatedAlign(
        alignment: _alignment,
        duration: const Duration(milliseconds: 100),
        child: const FlutterLogo(size: 100),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Animate'),
        onPressed: () => setState(() => _alignment = [
          Alignment.topRight,
          Alignment.topLeft,
          Alignment.topCenter,
          Alignment.bottomCenter,
          Alignment.bottomLeft,
          Alignment.bottomRight,
          Alignment.centerLeft,
          Alignment.centerLeft,
          Alignment.centerRight,
        ][Random().nextInt(9)]),
      ),
    );
  }
}
