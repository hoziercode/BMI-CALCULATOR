//import 'package:bmi/Result_page.dart';
import 'package:flutter/material.dart';
import 'input.dart';
//import 'Result_page.dart';
void main() {
  runApp(const BMICalculator());
}

class  BMICalculator extends StatelessWidget {

  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(title: 'BMI CALCULATOR'),
       theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
           primary: const Color(0xFF0A0E21),
           ),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
        
        textTheme:const TextTheme(
          bodyText1: TextStyle(
            color:Colors.white,
          ),
        ),
        ),
    );
  }
}
