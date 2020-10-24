import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constant.dart';
import '../components/reusableCard.dart';
import '../components/bottomContainer.dart';
import 'inputPage.dart';
import 'package:bmi_calculator/calculator_brain.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({@required this.advice, @required this.result, @required this.textResult});

  final String textResult ;
  final String result ;
  final String advice ;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Your Result',
                  style: kStyleNumberText,
                ),
              ),
            ),
            Expanded(
              flex: 5,
                child: ReusableCard(
              color: kContainerColor,

              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [

                  Text(textResult, style: kResultText),
                  Text(
                    result,
                    style: kStyleNumberText,
                  ),
                  Text(
                    advice,
                    style: kStyleText,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            )),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/input');
              },
              child: BottomContainer(text: 'Re-calculate'),
            ),
          ],
        ),
      ),
    );
  }
}
