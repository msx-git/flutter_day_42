import 'package:flutter/material.dart';

class AnimatedPositionedWidget extends StatefulWidget {
  const AnimatedPositionedWidget({super.key});

  @override
  State<AnimatedPositionedWidget> createState() =>
      _AnimatedPositionedWidgetState();
}

class _AnimatedPositionedWidgetState extends State<AnimatedPositionedWidget> {
  bool _isPositioned = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Positioned\nAnimatedPositionedDirectional"),
      ),
      body: Stack(
        children: [
          AnimatedPositioned(
            height: 200,
            width: 200,
            bottom: _isPositioned ? 50 : 150,
            duration: const Duration(milliseconds: 200),
            child: Container(color: Colors.blue),
          ),
          AnimatedPositionedDirectional(
            height: 200,
            width: 200,
            end: _isPositioned ? 50 : 150,
            duration: const Duration(milliseconds: 200),
            child: Container(color: Colors.blue),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => setState(() => _isPositioned = !_isPositioned),
        label: const Text('Animate'),
      ),
    );
  }
}
