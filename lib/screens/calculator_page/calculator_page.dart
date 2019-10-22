import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:bmi_calculator_flutter/screens/result_page/result_page.dart';

import 'package:bmi_calculator_flutter/utils/styles.dart' as customStyles;
import 'package:bmi_calculator_flutter/widgets/selection_card.dart';
import 'package:bmi_calculator_flutter/widgets/round_icon_button.dart';
import 'package:bmi_calculator_flutter/widgets/icon_content.dart';
import 'package:bmi_calculator_flutter/widgets/bottom_button.dart';
import 'package:bmi_calculator_flutter/utils/gender.dart';
import 'package:bmi_calculator_flutter/models/bmi_calculator.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key key}) : super(key: key);

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  Gender selectedGender;
  int userHeight = 180;
  int userWeight = 74;
  int userAge = 20;
  Color accentColor = Color(0xFFEB1555);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI Calculator')),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 7,
            child: Container(
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Flexible(
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            child: SelectionCard(
                              cardChild: IconContent(
                                iconData: FontAwesomeIcons.mars,
                                iconText: 'Male',
                              ),
                              cardColor: selectedGender == Gender.Male
                                  ? customStyles.selectedCardColor
                                  : customStyles.cardColor,
                              onCardTap: () => setState(() {
                                selectedGender = Gender.Male;
                                accentColor = Color(0xFF6874E8);
                              }),
                            ),
                          ),
                          Flexible(
                            child: SelectionCard(
                              cardChild: IconContent(
                                iconData: FontAwesomeIcons.venus,
                                iconText: 'Female',
                              ),
                              cardColor: selectedGender == Gender.Female
                                  ? customStyles.selectedCardColor
                                  : customStyles.cardColor,
                              onCardTap: () => setState(() {
                                selectedGender = Gender.Female;
                                accentColor = Color(0xFFEB1555);
                              }),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: SelectionCard(
                        cardColor: customStyles.selectedCardColor,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('HEIGHT', style: customStyles.labelTextStyle),
                            Row(
                              textBaseline: TextBaseline.alphabetic,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              children: <Widget>[
                                Text(
                                  userHeight.toString(),
                                  style: customStyles.numbersTextStyle,
                                ),
                                Text(
                                  'cm',
                                  style: customStyles.labelTextStyle,
                                ),
                              ],
                            ),
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                inactiveTrackColor: Color(0xFF8D8E98),
                                activeTrackColor: Colors.white,
                                thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 12.0,
                                ),
                                thumbColor: accentColor,
                                overlayColor: Color(0x338D8E98),
                              ),
                              child: Slider(
                                value: userHeight.toDouble(),
                                min: 100,
                                max: 230,
                                onChanged: (double newValue) => setState(
                                  () => userHeight = newValue.round(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            child: SelectionCard(
                              cardColor: customStyles.selectedCardColor,
                              cardChild: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'WEIGHT',
                                    style: customStyles.labelTextStyle,
                                  ),
                                  Text(
                                    userWeight.toString(),
                                    style: customStyles.numbersTextStyle,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      RoundIconButton(
                                        icon: FontAwesomeIcons.minus,
                                        onPressed: () =>
                                            setState(() => userWeight--),
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      RoundIconButton(
                                        icon: FontAwesomeIcons.plus,
                                        onPressed: () =>
                                            setState(() => userWeight++),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          Flexible(
                            child: SelectionCard(
                              cardColor: customStyles.selectedCardColor,
                              cardChild: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'AGE',
                                    style: customStyles.labelTextStyle,
                                  ),
                                  Text(
                                    userAge.toString(),
                                    style: customStyles.numbersTextStyle,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      RoundIconButton(
                                        icon: FontAwesomeIcons.minus,
                                        onPressed: () =>
                                            setState(() => userAge--),
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      RoundIconButton(
                                        icon: FontAwesomeIcons.plus,
                                        onPressed: () =>
                                            setState(() => userAge++),
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
                  ],
                ),
              ),
            ),
          ),
          BottomButton(
            buttonText: 'CALCULATE',
            color: accentColor,
            onPressed: () {
              BMICalculator calc = BMICalculator(userHeight, userWeight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    accentColor: accentColor,
                    bmiResult: calc.calculateBMI(),
                    bmiHeader: calc.getResult(),
                    bmiDescription: calc.getDescription(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
