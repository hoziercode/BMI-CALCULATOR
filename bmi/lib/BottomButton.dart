// ignore: file_names
import 'package:flutter/material.dart';
//import 'constant.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key, this.onPress, this.buttonChild
  }) : super(key: key);

  final Function()? onPress;
  final Widget? buttonChild;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        color: const Color(0xFFEB1555),
        margin: const EdgeInsets.only(top: 10.0),
        //padding: const EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: 80.0,
        child: buttonChild,
      ),
    );
  }
}
