import 'package:flutter/material.dart';

//For small round button=================================================================

// ignore: must_be_immutable
class CustomRoundButton extends StatelessWidget {
  CustomRoundButton({
    this.backgroundColor,
    required this.onTap,
    Key? key,
  }) : super(key: key);
  Color? backgroundColor;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: CircleAvatar(
          radius: 5,
          backgroundColor:
              backgroundColor ?? Color.fromRGBO(217, 217, 217, 0.68),
        ),
      ),
    );
  }
}

//For normally used square button========================================================
// ignore: must_be_immutable
class CustomSquareButton extends StatelessWidget {
  CustomSquareButton({
    this.w,
    this.h,
    required this.onTap,
    required this.buttonText,
    this.borderRadius,
    this.buttonColor,
    this.textColor,
    this.fontSize,
    this.width,
    this.height,
    Key? key,
  }) : super(key: key);

  double? w;
  double? h;
  VoidCallback onTap;
  String buttonText;
  double? borderRadius;
  Color? buttonColor;
  Color? textColor;
  double? fontSize;
  double? width;
  double? height;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: width ?? w * 0.9,
          height: height ?? h * 0.07,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
            color: buttonColor ?? Color.fromRGBO(11, 55, 120, 1),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(217, 217, 217, 0.68).withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(
                fontSize: fontSize ?? 25,
                color: textColor ?? Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//Backward Button=================================================================

// ignore: camel_case_types
class backButton extends StatelessWidget {
  const backButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
      padding: EdgeInsets.only(
        left: 20.0,
      ),
    );
  }
}

//Close Button===================================================================
// ignore: camel_case_types
class closebutton extends StatelessWidget {
  const closebutton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.close),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}

//login option button=====================================================================
// ignore: camel_case_types
class loginOption extends StatelessWidget {
  const loginOption({
    Key? key,
    required this.images,
  }) : super(key: key);

  final List images;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List<Widget>.generate(3, (index) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: CircleAvatar(
            radius: 25,
            backgroundColor: Color.fromRGBO(217, 217, 217, 0.68),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("img/" + images[index]),
            ),
          ),
        );
      }),
    );
  }
}
