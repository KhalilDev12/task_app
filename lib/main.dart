import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/services/apiService.dart';
import 'package:task_app/views/pages/homePage.dart';
import 'package:task_app/views/pages/splashPage.dart';

import 'controller/taskProvider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => TaskProvider(ApiService(), context),
    child: SplashPage(
      onInitComplete: () {
        runApp(
          ChangeNotifierProvider(
            create: (context) => TaskProvider(
              ApiService(),
              context,
            ),
            child: MyApp(),
          ),
        );
      },
    ),
  ));
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
      home: HomePage(),
    );
  }
}
