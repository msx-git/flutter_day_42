import 'package:flutter/material.dart';

class ExplicitAnimation extends StatefulWidget {
  const ExplicitAnimation({super.key});

  @override
  State<ExplicitAnimation> createState() => _ExplicitAnimationState();
}

class _ExplicitAnimationState extends State<ExplicitAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _containerAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    );
    _containerAnimation = Tween<double>(
      begin: 0,
      end: 400,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Explicit Animation')),
      body: AnimatedBuilder(
          animation: _containerAnimation,
          builder: (context, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: double.infinity),
                Center(
                  child: Text(
                    '${(_animationController.value * 100).toStringAsFixed(0)}%',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  height: 20,
                  width: _containerAnimation.value,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ],
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _animationController.repeat();
        },
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
