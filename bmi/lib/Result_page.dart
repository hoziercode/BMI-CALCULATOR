// ignore: file_names
import 'package:bmi/Reuseable.dart';
import 'package:bmi/constant.dart';
import 'package:flutter/material.dart';
import 'BottomButton.dart';
//import 'input.dart';

class Result extends StatelessWidget {
  const Result({Key? key, this.bmiResult, this.interpretation, this.textResult})
      : super(key: key);

  final String? bmiResult;
  final String? textResult;
  final String? interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('BMI CALCULATOR'),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 15.0),
                  child: Text(
                    'YOUR RESULT',
                    style: result,
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Reuseable(
                  colour: activateCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        textResult.toString().toUpperCase(),
                        style: resultStyle,
                      ),
                      Text(
                        bmiResult.toString(),
                        style: bmiresult,
                      ),
                      Center(
                        child: Text(
                          interpretation.toString(),
                          style: bmi,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              BottomButton(
                onPress: () {
                  Navigator.pop(context);
                },
                buttonChild: const Center(
                  child: Text(
                    "RECALCULATE",
                    style: calculateButton,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
