
// ignore_for_file: file_names

import 'package:flutter/material.dart';

class RoundedCircleButton extends StatelessWidget {
  const RoundedCircleButton({Key? key, this.myChild, this.onPress})
      : super(key: key);

  final Widget? myChild;
  final Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      onPressed: onPress,
      elevation: 7.0,
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      child: myChild,
    );
  }
}
