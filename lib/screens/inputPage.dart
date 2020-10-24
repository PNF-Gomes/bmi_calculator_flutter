import 'package:bmi_calculator/screens/resultsPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/genderCardContent.dart';
import '../components/reusableCard.dart';
import '../constant.dart';
import '../components/roundIconBottom.dart';
import 'package:bmi_calculator/components/bottomContainer.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum GenderPick {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderPick genderPick;
  int height = 160;
  int weight = 65;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: genderPick == GenderPick.male
                        ? kContainerColor
                        : kInactiveContainerColor,
                    onPress: () {
                      setState(() {
                        genderPick = GenderPick.male;
                      });
                    },
                    cardChild: genderCardContent(
                      icon: FontAwesomeIcons.mars,
                      gender: 'Male',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: genderPick == GenderPick.female
                        ? kContainerColor
                        : kInactiveContainerColor,
                    onPress: () {
                      setState(() {
                        genderPick = GenderPick.female;
                      });
                    },
                    cardChild: genderCardContent(
                      icon: FontAwesomeIcons.venus,
                      gender: 'Female',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Heigt',
                    style: kStyleText,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(), style: kStyleNumberText),
                        Text(
                          'CM',
                          style: kStyleText,
                        ),
                      ],
                    ),
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                      thumbColor: Colors.purpleAccent,
                      activeTrackColor: Colors.white,
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 100,
                      max: 220,
                      onChanged: (double value) {
                        setState(() {
                          height = value.toInt();
                        });
                      },
                    ),
                  ),
                ],
              ),
              color: kContainerColor,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: kContainerColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Weight',
                          style: kStyleText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              weight.toString(),
                              style: kStyleNumberText,
                            ),
                            Text(
                              'KG',
                              style: kStyleText,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: Icons.add,
                              action: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: Icons.remove,
                              action: () {
                                setState(() {
                                  weight > 25 ? weight-- : weight = 25;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kContainerColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Age',
                          style: kStyleText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              age.toString(),
                              style: kStyleNumberText,
                            ),
                            Text(
                              'Y',
                              style: kStyleText,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: Icons.add,
                              action: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            RoundIconButton(
                              icon: Icons.remove,
                              action: () {
                                setState(() {
                                  age > 10 ? age-- : age = 10;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(
                  height: height.toDouble(), weight: weight.toDouble());
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    result: calc.calculateBMi(),
                    textResult: calc.getResult(),
                    advice: calc.getInterpretation(),
                  ),
                ),
              );
            },
            child: BottomContainer(
              text: 'Calculate',
            ),
          ),
        ],
      ),
    );
  }
}
