import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String title;
  final TextEditingController controller;
  TextInputType? keyboardType = TextInputType.text;
  int? maxLines = 1;

  AppTextField({Key? key,
    required this.title,
    required this.controller,
    this.keyboardType,
    this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery
        .of(context)
        .size
        .height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        SizedBox(height: deviceHeight * 0.01),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          validator: (value) {
            if ((value == null) || (value.isEmpty)) {
              return 'Please enter some text';
            }
            return null;
          },
        ),
      ],
    );
  }
}
