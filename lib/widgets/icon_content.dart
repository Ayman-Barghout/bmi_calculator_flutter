import 'package:flutter/material.dart';

import '../utils/styles.dart' as customStyles;

class IconContent extends StatelessWidget {
  const IconContent({Key key, this.iconData, this.iconText}) : super(key: key);
  final IconData iconData;
  final String iconText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Icon(
            iconData,
            size: 50.0,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            iconText,
            style: customStyles.labelTextStyle,
          ),
        ],
      ),
    );
  }
}
