import 'package:flutter/material.dart';

class AnimatedPhysicalModelWidget extends StatefulWidget {
  const AnimatedPhysicalModelWidget({super.key});

  @override
  State<AnimatedPhysicalModelWidget> createState() =>
      _AnimatedPhysicalModelWidgetState();
}

class _AnimatedPhysicalModelWidgetState
    extends State<AnimatedPhysicalModelWidget> {
  bool _isChanged = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animated Physical Model")),
      body: Center(
        child: AnimatedPhysicalModel(
          shape: BoxShape.rectangle,
          color: Colors.teal,
          duration: const Duration(milliseconds: 400),
          elevation: _isChanged ? 10 : 20,
          borderRadius: BorderRadius.circular(_isChanged ? 15 : 30),
          shadowColor: Colors.teal,
          child: Container(
            height: 150,
            width: 300,
            alignment: Alignment.center,
            child: const Text(
              "Animated Physical Model",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => setState(() => _isChanged = !_isChanged),
        label: const Text('Animate'),
      ),
    );
  }
}
