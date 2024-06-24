import 'package:flutter/material.dart';

class Task1 extends StatefulWidget {
  const Task1({super.key});

  @override
  State<Task1> createState() => _Task1State();
}

class _Task1State extends State<Task1> with TickerProviderStateMixin {
  bool _isDay = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 1'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        color: _isDay ? Colors.blue : const Color(0xff303030),
        child: Center(
          child: Container(
            width: 250,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: AnimatedCrossFade(
                    firstChild: const CloudsAnimation(),
                    secondChild: const RoadAnimation(),
                    crossFadeState: _isDay
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    duration: const Duration(milliseconds: 300),
                  ),
                ),
                AnimatedPositioned(
                  right: _isDay ? 0 : 150,
                  duration: const Duration(milliseconds: 300),
                  child: GestureDetector(
                    onTap: () => setState(() => _isDay = !_isDay),
                    child: Container(
                      height: 100,
                      width: 100,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        shape: BoxShape.circle,
                      ),
                      child: Transform.rotate(
                        angle: 25.9,
                        child: SizedBox(
                          width: 55,
                          child: Image.asset('assets/images/plane.png'),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CloudsAnimation extends StatefulWidget {
  const CloudsAnimation({super.key});

  @override
  State<CloudsAnimation> createState() => _CloudsAnimationState();
}

class _CloudsAnimationState extends State<CloudsAnimation> {
  @override
  Widget build(BuildContext context) {
    return const Text('clouds');
  }
}

class RoadAnimation extends StatefulWidget {
  const RoadAnimation({super.key});

  @override
  State<RoadAnimation> createState() => _RoadAnimationState();
}

class _RoadAnimationState extends State<RoadAnimation> {
  @override
  Widget build(BuildContext context) {
    return const Text('road');
  }
}
