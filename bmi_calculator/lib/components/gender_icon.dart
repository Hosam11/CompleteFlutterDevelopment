import 'package:flutter/material.dart';
import '../constants.dart';

class GenderIcon extends StatelessWidget {
  final String label;
  final IconData mIcon;

  GenderIcon({@required this.label, @required this.mIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          mIcon,
          size: 50.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
