import 'package:flutter/material.dart';

class SelectionCard extends StatelessWidget {
  const SelectionCard({Key key, this.cardColor, this.cardChild, this.onCardTap})
      : super(key: key);
  final Color cardColor;
  final Widget cardChild;
  final Function onCardTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardTap,
      child: Container(
        decoration: BoxDecoration(
            color: cardColor, borderRadius: BorderRadius.circular(10.0)),
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.all(15.0),
        child: cardChild,
      ),
    );
  }
}
