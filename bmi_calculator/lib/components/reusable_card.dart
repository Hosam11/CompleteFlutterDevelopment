import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({@required this.mColor, this.mChild, this.onTap});

  final Color mColor;
  final Widget mChild;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: mChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: mColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
