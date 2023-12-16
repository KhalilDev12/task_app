import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Function() onPressed;
  final String title;

  AppButton({Key? key, required this.onPressed, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: deviceHeight * 0.08,
      width: deviceWidth * 0.6,
      child: OutlinedButton(
        style: ButtonStyle(
            shape: MaterialStatePropertyAll(BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: Colors.purpleAccent)))),
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
