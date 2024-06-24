import 'package:flutter/material.dart';

class AnimatedCrossFadeWidget extends StatefulWidget {
  const AnimatedCrossFadeWidget({super.key});

  @override
  State<AnimatedCrossFadeWidget> createState() =>
      _AnimatedCrossFadeWidgetState();
}

class _AnimatedCrossFadeWidgetState extends State<AnimatedCrossFadeWidget> {
  bool _isFirst = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('Animated Cross Fade\nAnimated Switcher')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedCrossFade(
            firstChild: ElevatedButton(
              onPressed: () {},
              child: const Text("ElevatedButton"),
            ),
            secondChild: FilledButton(
              onPressed: () {},
              child: const Text("FilledButton"),
            ),
            duration: const Duration(milliseconds: 500),
            crossFadeState:
                _isFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          ),
          const SizedBox(height: 12),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            switchInCurve: Curves.bounceIn,
            switchOutCurve: Curves.bounceOut,
            child: _isFirst ? const Text('First') : const Text("Second"),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => setState(() => _isFirst = !_isFirst),
        label: const Text('Animate'),
      ),
    );
  }
}
