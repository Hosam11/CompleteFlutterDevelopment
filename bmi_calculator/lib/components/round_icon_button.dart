import 'package:flutter/material.dart';

const BoxConstraints _kSizeConstraints = BoxConstraints.tightFor(
  width: 56.0,
  height: 56.0,
);

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function onPress;

  RoundIconButton({this.icon, this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      elevation: 0.6,
      shape: CircleBorder(),
      child: Icon(icon),
      constraints: _kSizeConstraints,
      fillColor: Color(0xFF4C4F5E),
    );
  }
}
