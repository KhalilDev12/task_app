import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_app/config/routes.dart';
import 'package:task_app/providers/taskProvider.dart';
import 'package:task_app/services/apiService.dart';
import 'package:task_app/views/pages/addTaskPage.dart';
import 'package:task_app/views/pages/homePage.dart';
import 'package:task_app/views/pages/splashPage.dart';
import 'package:task_app/views/pages/tasksListPage.dart';

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
      initialRoute: AppRoutes.homePage,
      routes: {
        AppRoutes.homePage: (context) => HomePage(),
        AppRoutes.tasksList: (context) => TasksListPage(),
        AppRoutes.addTask: (context) => AddTaskPage()
      },
    );
  }
}
