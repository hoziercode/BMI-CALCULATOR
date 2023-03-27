// ignore_for_file: file_names

import 'package:flutter/material.dart';

class Reuseable extends StatelessWidget {
  const Reuseable({Key? key, this.colour, this.cardChild, this.onPress}) : super(key: key);

  final Color? colour;
   final Widget? cardChild;
  final Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
            color: colour,
            borderRadius: BorderRadius.circular(10.0)),
        margin: const EdgeInsets.all(15.0),
        child: cardChild,
      ),
    );
  }
}
