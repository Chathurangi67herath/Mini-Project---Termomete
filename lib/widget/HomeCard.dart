import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final String title;
  final String upperTitle;
  final Color primaryColor;
  final Color secondaryColor;
  final double heigt;

  HomeCard(
      {required this.title,
      required this.upperTitle,
      this.primaryColor = const Color.fromRGBO(11, 55, 120, 1),
      this.secondaryColor = const Color.fromARGB(255, 23, 33, 179),
      this.heigt = 100,
      Key? key})
      : super(key: key);
  // final primaryColor = const Color.fromRGBO(11, 55, 120, 1);
  // fina secondaryColor = Color.fromARGB(255, 23, 33, 179);
  final accentColor = const Color(0xffffffff);
  final backgroundColor = const Color(0xffffffff);
  final errorColor = const Color(0xffEF4444);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      height: heigt,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          gradient: LinearGradient(colors: [primaryColor, secondaryColor])),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontWeight: FontWeight.normal)),
            Text(upperTitle,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}
