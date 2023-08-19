import 'package:flutter/material.dart';

//input fields login sihgnup profile==============================================================
// ignore: must_be_immutable, camel_case_types
class inputField extends StatelessWidget {
  inputField({
    required this.hintText,
    required this.prefixIcon,
    Key? key,
  }) : super(key: key);

  String hintText;
  Icon prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
        color: Color.fromRGBO(217, 217, 217, 0.68),
        borderRadius: BorderRadius.circular(20),
      ),
      width: 450,
      child: TextField(
        obscureText: false,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            //fontFamily: 'Poppins-Bold',
            color: Color.fromRGBO(11, 55, 120, 1),
          ),
          prefixIcon: prefixIcon,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.white, width: 1.0)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                  color: Color.fromRGBO(217, 217, 217, 0.68), width: 1.0)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          alignLabelWithHint: false,
          filled: true,
        ),
        keyboardType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.done,
      ),
    );
  }
}

//Verification Code Entering Boxes======================================================================================================================
class VerifyBox extends StatelessWidget {
  const VerifyBox({
    Key? key,
    required this.w,
  }) : super(key: key);

  final double w;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 50.0,
        decoration: BoxDecoration(
          color: Color.fromRGBO(217, 217, 217, 0.68),
          borderRadius: BorderRadius.circular(20),
        ),
        child: TextField(
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(color: Colors.white, width: 1.0)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide(
                    color: Color.fromRGBO(217, 217, 217, 0.68), width: 1.0)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            alignLabelWithHint: false,
            filled: true,
            counterText: '',
          ),
          maxLength: 1,
        ),
      ),
    );
  }
}

//freezer details============================================================================
// ignore: must_be_immutable, camel_case_types
class detailsview extends StatelessWidget {
  double? width;
  double? height;
  String text;
  String? additionalText;
  Color? color;
  Color? textColor;
  Color? textColor2;
  double? textSize;
  String? emoji;

  detailsview({
    Key? key,
    this.width,
    this.height,
    required this.text,
    this.additionalText,
    this.color,
    this.textColor,
    this.textColor2,
    this.textSize,
    this.emoji,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    final double h = MediaQuery.of(context).size.height;

    return Container(
      width: width ?? w * 0.5,
      height: height ?? h * 0.06,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: color ?? Color.fromRGBO(217, 217, 217, 0.68),
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: TextStyle(
                  color: textColor ?? Color.fromRGBO(11, 55, 120, 1),
                  fontSize: textSize ?? 15.0,
                ),
              ),
              if (additionalText != null)
                Text(
                  additionalText!,
                  style: TextStyle(
                    color: textColor2 ?? Colors.red,
                    fontSize: textSize ?? 15.0,
                  ),
                ),
            ],
          ),
          SizedBox(
            height: h * 0.01,
          ),
          if (emoji != null)
            Text(
              emoji!,
              style: TextStyle(fontSize: 32.0, color: textColor2 ?? Colors.red),
            ),
        ],
      ),
    );
  }
}
