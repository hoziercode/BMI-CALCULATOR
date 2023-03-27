// ignore_for_file: file_names
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'constant.dart';
class IconsAndText extends StatelessWidget {
  const IconsAndText({Key? key, this.icon, this.text}) : super(key: key);

  final String? text;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
          color: Colors.white,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          text!,
          style: textStyle,
        ),
      ],
    );
  }
}
