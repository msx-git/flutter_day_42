import 'package:flutter/material.dart';

class AnimatedOpacityWidget extends StatefulWidget {
  const AnimatedOpacityWidget({super.key});

  @override
  State<AnimatedOpacityWidget> createState() => _AnimatedOpacityWidgetState();
}

class _AnimatedOpacityWidgetState extends State<AnimatedOpacityWidget> {
  bool isVisible = true;
  bool isPadded = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Opacity & Animated Padding"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AnimatedOpacity(
            opacity: isVisible ? 1 : 0,
            duration: const Duration(milliseconds: 400),
            child: const FlutterLogo(size: 100),
          ),
          const SizedBox(height: 16),
          Container(
            color: Colors.teal,
            child: AnimatedPadding(
              duration: const Duration(milliseconds: 400),
              padding: EdgeInsets.all(isPadded ? 50 : 25),
              child: Container(
                color: Colors.deepPurple,
                child: const FlutterLogo(size: 100),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Animate'),
        onPressed: () => setState(() {
          isVisible = !isVisible;
          isPadded = !isPadded;
        }),
      ),
    );
  }
}
