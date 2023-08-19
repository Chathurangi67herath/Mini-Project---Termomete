import 'package:flutter/material.dart';

//head text=============================================================

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  CustomText({
    required this.text,
    this.textColor,
    this.fontSize,
    this.fontFamily,
    Key? key,
  }) : super(key: key);

  String text;
  Color? textColor;
  double? fontSize;
  String? fontFamily;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: textColor ?? Colors.white,
        fontSize: fontSize ?? 20,
        fontFamily: 'Lemon-Regular',
      ),
    );
  }
}

//edit input============================================================
// ignore: must_be_immutable, camel_case_types
class editInputTitle extends StatelessWidget {
  editInputTitle({
    required this.text,
    this.icon,
    Key? key,
  }) : super(key: key);

  String text;
  IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: Color.fromRGBO(11, 55, 120, 1),
        ),
        SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(
            fontFamily: 'Poppins-Bold',
            color: Color.fromRGBO(11, 55, 120, 1),
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }
}
