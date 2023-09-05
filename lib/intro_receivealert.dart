// ignore: duplicate_ignore
// ignore_for_file: camel_case_types, duplicate_ignore

import 'package:flutter/material.dart';
import 'intro_checktemp.dart';
import 'intro_search.dart';
import 'intro_settemp.dart';
import 'widget/Custom_button.dart';
import 'widget/Custom_text.dart';

// ignore: camel_case_types
class Intro_alert extends StatefulWidget {
  const Intro_alert({super.key});

  @override
  State<Intro_alert> createState() => _Intro_alertState();
}

class _Intro_alertState extends State<Intro_alert> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 246, 254, 1),
      body: Column(
        children: [
          Container(
            height: h * 0.4,
            width: w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40.0),
                bottomRight: Radius.circular(40.0),
              ),
              image: DecorationImage(
                image: AssetImage("img/intro_receivealert.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: h * 0.27,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 32.0),
                  child: CustomText(
                    text: 'Receive notifications about freezers ',
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: h * 0.05,
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              "You can receive the alerts when temperature is low or high to particular limit ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Color.fromRGBO(11, 55, 120, 1),
              ),
            ),
          ),
          Column(
            children: [
              Image(
                image: AssetImage("img/alert1.png"),
                width: w * 0.45,
              )
            ],
          ),
          SizedBox(height: w * 0.12),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Intro_checkTemp(),
                  ));
                },
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Color.fromRGBO(11, 55, 120, 1),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: w * 0.2,
              ),
              CustomRoundButton(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Intro_checkTemp(),
                  ));
                },
              ),
              CustomRoundButton(
                backgroundColor: Color.fromRGBO(11, 55, 120, 1),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Intro_alert(),
                  ));
                },
              ),
              CustomRoundButton(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Intro_settemp(),
                  ));
                },
              ),
              CustomRoundButton(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Intro_search(),
                  ));
                },
              ),
              SizedBox(
                width: w * 0.2,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Intro_settemp(),
                  ));
                },
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Color.fromRGBO(11, 55, 120, 1),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
