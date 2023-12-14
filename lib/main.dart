import 'package:flutter/material.dart';
import 'package:task_app/pages/homePage.dart';
import 'package:task_app/pages/splashScreen.dart';
import 'package:task_app/pages/tasksPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Application',
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      //home: SplashScreen(onInitializationComplete: () {}),
      home: HomePage(),
    );
  }
}
