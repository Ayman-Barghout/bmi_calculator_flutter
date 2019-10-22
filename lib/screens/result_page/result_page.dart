import 'package:flutter/material.dart';

import 'package:bmi_calculator_flutter/utils/styles.dart' as customStyles;
import 'package:bmi_calculator_flutter/widgets/selection_card.dart';
import 'package:bmi_calculator_flutter/widgets/bottom_button.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {Key key,
      @required this.bmiResult,
      @required this.bmiHeader,
      @required this.bmiDescription,
      @required this.accentColor})
      : super(key: key);

  final String bmiResult;
  final String bmiHeader;
  final String bmiDescription;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI Calculator')),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(10.0),
              child: Text(
                'Your Result',
                style: customStyles.titleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: SelectionCard(
              cardColor: customStyles.selectedCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    bmiHeader.toUpperCase(),
                    style: customStyles.resultHeaderTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: customStyles.bmiTextStyle,
                  ),
                  Text(
                    bmiDescription,
                    style: customStyles.resultDescriptionTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            buttonText: 'RE-CALCULATE',
            color: accentColor,
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
