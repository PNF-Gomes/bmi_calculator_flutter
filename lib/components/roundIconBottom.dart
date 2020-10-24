import 'package:flutter/material.dart';
import '../constant.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({this.icon, this.action});

  IconData icon;
  Function action;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: action,
      elevation: 10.0,
      constraints: BoxConstraints.tightFor(
        width: 40.0,
        height: 40.0,
      ),
      shape: CircleBorder(),
      fillColor: kInactiveContainerColor,
      child: Icon(
        icon,
      ),
    );
  }
}
