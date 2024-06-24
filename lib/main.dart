import 'package:flutter/material.dart';
import 'package:flutter_day_42/explicit/views/explicit_animation.dart';

import 'implicit/views/widgets/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  var _themeData = ThemeData.light();

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      //() => setState(() => _themeData = ThemeData.dark()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedTheme(
        data: _themeData,
        duration: const Duration(seconds: 1),
        child: PageView(
          children: const [
            ExplicitAnimation(),
            AnimatedAlignWidget(),
            AnimatedContainerWidget(),
            AnimatedOpacityWidget(),
            AnimatedPhysicalModelWidget(),
            AnimatedPositionedWidget(),
            AnimatedCrossFadeWidget(),
            AnimatedListWidget(),
          ],
        ),
      ),
    );
  }
}
