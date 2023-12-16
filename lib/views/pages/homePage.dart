import 'package:flutter/material.dart';
import 'package:task_app/config/routes.dart';
import 'package:task_app/views/pages/addTaskPage.dart';
import 'package:task_app/views/widgets/appButton.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  late double deviceHeight, deviceWidth;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppButton(
                onPressed: () {
                  // Simple Navigation to Tasks List Page
                  Navigator.pushNamed(context, AppRoutes.tasksList);
                },
                title: "Tasks List"),
            SizedBox(height: deviceHeight*0.05),
            AppButton(
                onPressed: () {
                  // Navigate To Add Task Page Using Animation
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          transitionDuration: const Duration(seconds: 1),
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  AddTaskPage(),
                          transitionsBuilder: _slideAnimation));
                },
                title: "Add A Task"),
          ],
        ),
      ),
    );
  }

  Widget _slideAnimation(context, animation, secondaryAnimation, child) {
    const begin = Offset(1.0, 0.0);
    const end = Offset.zero;
    const curve = Curves.easeInOut;
    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    var offsetAnimation = animation.drive(tween);

    return SlideTransition(position: offsetAnimation, child: child);
  }
}
