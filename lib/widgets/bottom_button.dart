import 'package:flutter/material.dart';

import 'package:bmi_calculator_flutter/utils/styles.dart' as customStyles;

class BottomButton extends StatelessWidget {
  const BottomButton(
      {Key key,
      this.color,
      @required this.buttonText,
      @required this.onPressed})
      : super(key: key);

  final String buttonText;
  final Function onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          constraints: BoxConstraints.expand(),
          alignment: Alignment.bottomCenter,
          color: color,
          padding: EdgeInsets.only(bottom: 10.0),
          child: Center(
            child: Text(
              buttonText,
              style: customStyles.largeButtonTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
