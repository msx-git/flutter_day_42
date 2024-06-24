import 'package:flutter/material.dart';

class Task2 extends StatefulWidget {
  const Task2({super.key});

  @override
  State<Task2> createState() => _Task2State();
}

class _Task2State extends State<Task2> {
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task 2'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 400,
            child: PageView.builder(
              controller: pageController,
              // itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(color: Colors.teal),
                  alignment: Alignment.center,
                  child: Text("Page $index"),
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
      ),
    );
  }
}
