import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/taskProvider.dart';


class SplashPage extends StatefulWidget {
  final VoidCallback onInitComplete;

  SplashPage({Key? key, required this.onInitComplete}) : super(key: key);

  @override
  _SplashPageState createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  late double deviceHeight, deviceWidth;

  @override
  void initState() {
    super.initState();
    // after 3 seconds call setup method then go to Home Page
    Future.delayed(const Duration(seconds: 3)).then(
      (value) => _setup(context).then(
        (value) {
          widget.onInitComplete();
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  // This Function to get Data or setup config in your app
  Future<void> _setup(BuildContext context) async {
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);
    await taskProvider.getTasks();
    print("Fetching Complete");
  }

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Container(
            height: deviceHeight * 0.2,
            width: deviceHeight * 0.2,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/flutter_logo.png"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
