import 'package:flutter/material.dart';
import '../constant.dart';




class genderCardContent extends StatelessWidget {
  genderCardContent({this.icon, this.gender});

  final IconData icon;
  final String gender;
  Color textColor = kColorIcon;



  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: textColor,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          gender,
          style: kStyleText
        ),
      ],
    );
  }
}