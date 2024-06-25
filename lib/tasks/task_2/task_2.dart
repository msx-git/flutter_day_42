import 'package:flutter/material.dart';

class Task2 extends StatefulWidget {
  const Task2({super.key});

  @override
  State<Task2> createState() => _Task2State();
}

class _Task2State extends State<Task2> with SingleTickerProviderStateMixin{

  final pageController = PageController();
  late final AnimationController _animationController;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _animation = Tween<double>(
      begin: 0,
      end: 400,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    // _animationController.forward();
    _animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 2'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
          return Column(
            children: [
              SizedBox(
                height: 400,
                child: PageView.builder(
                  controller: pageController,
                  // itemCount: 10,
                  itemBuilder: (context, index) {
                    pageController.nextPage(duration: Duration(seconds: 3), curve: Curves.linear);
                    return Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(color: Colors.teal),
                      alignment: Alignment.center,
                      child: Text("Page $index",style: TextStyle(color: Colors.white),),
                    );
                  },
                ),
              ),
              IconButton(
                onPressed: () {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                icon: const Icon(Icons.navigate_next),
              )
            ],
          );
        }
      ),
    );
  }
}
