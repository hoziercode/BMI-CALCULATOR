import 'package:bmi/Result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Reuseable.dart';
import 'IconsAndText.dart';
import 'constant.dart';
import 'RoundedButton.dart';
import 'BottomButton.dart';
import 'Calculator_Brain.dart';

enum Gender {
  male,
  female,
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 1;

  void reduce() {
    setState(() {
      if (weight == 0) {
        weight = 0;
      } else {
        weight--;
      }
    });
  }

  void reduceAge() {
    setState(() {
      if (age == 1) {
        age = 1;
      } else {
        age--;
      }
    });
  }

  void increase() {
    setState(() {
      weight++;
    });
  }

  void increaseAge() {
    setState(() {
      age++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Reuseable(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? activateCardColor
                        : inActivateCardColor,
                    cardChild: const IconsAndText(
                      icon: (FontAwesomeIcons.mars),
                      text: ('MALE'),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Reuseable(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? activateCardColor
                        : inActivateCardColor,
                    cardChild: const IconsAndText(
                      icon: (FontAwesomeIcons.venus),
                      text: ('FEMALE'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Reuseable(
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'HEIGHT',
                  style: textStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: heightStyle,
                    ),
                    const Text(
                      'cm',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbColor: const Color(0xFFEB1555),
                    activeTrackColor: Colors.white,
                    overlayColor: const Color(0x40EB1555),
                    inactiveTrackColor: const Color(0xFF8D8E98),
                    thumbShape:
                        const RoundSliderThumbShape(enabledThumbRadius: 13.0),
                    overlayShape:
                        const RoundSliderOverlayShape(overlayRadius: 20.0),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double newvalue) {
                      setState(() {
                        height = newvalue.round();
                      });
                    },
                  ),
                ),
              ],
            ),
            colour: kMyColor,
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Reuseable(
                    colour: kMyColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'WEIGHT',
                          style: textStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: heightStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedCircleButton(
                              myChild: const Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                              onPress: () {
                                reduce();
                              },
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundedCircleButton(
                              myChild: const Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                              onPress: () {
                                increase();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Reuseable(
                    colour: kMyColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'AGE',
                          style: textStyle,
                        ),
                        Text(
                          age.toString(),
                          style: heightStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundedCircleButton(
                              onPress: () {
                                reduceAge();
                              },
                              myChild: const Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundedCircleButton(
                              onPress: () {
                                increaseAge();
                              },
                              myChild: const Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            onPress: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Result(
                    bmiResult: calc.calculateBmi(),
                    textResult: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
            buttonChild: const Center(
              child: Text(
                "CALCULATE",
                style: calculateButton,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
