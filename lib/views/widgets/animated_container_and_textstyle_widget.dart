import 'package:flutter/material.dart';

class AnimatedContainerWidget extends StatefulWidget {
  const AnimatedContainerWidget({super.key});

  @override
  State<AnimatedContainerWidget> createState() =>
      _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
  bool isBig = false;
  var _align = Alignment.topCenter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Container\nAnimated Default TextStyle"),
      ),
      body: AnimatedAlign(
        alignment: _align,
        duration: const Duration(milliseconds: 400),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          height: isBig ? 300 : 150,
          width: isBig ? 300 : 150,
          color: isBig ? Colors.teal : Colors.green,
          alignment: Alignment.center,
          child: AnimatedDefaultTextStyle(
            style: isBig
                ? const TextStyle(fontSize: 32)
                : const TextStyle(fontSize: 16),
            duration: const Duration(milliseconds: 400),
            child: Text(isBig ? 'Big container' : 'Small container'),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Animate'),
        onPressed: () {
          isBig = !isBig;
          _align = isBig ? Alignment.center : Alignment.topCenter;
          setState(() {});
        },
      ),
    );
  }
}
