// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'intro_checktemp.dart';
import 'intro_receivealert.dart';
import 'intro_search.dart';
import '/widget/Custom_button.dart';
import '/widget/Custom_text.dart';

class Intro_settemp extends StatefulWidget {
  const Intro_settemp({super.key});

  @override
  State<Intro_settemp> createState() => _Intro_settempState();
}

class _Intro_settempState extends State<Intro_settemp> {
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
                image: AssetImage("img/intro_settemp.jpg"),
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
                    text: 'Set a new freezer Temperature range ',
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
              "You can set the appropriate temperature range for the new freezer ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Color.fromRGBO(11, 55, 120, 1),
              ),
            ),
          ),
          SizedBox(height: w * 0.05),
          Column(
            children: [
              Image(
                image: AssetImage("img/settemp.png"),
                width: w * 0.4,
              )
            ],
          ),
          SizedBox(height: w * 0.1),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Intro_alert(),
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
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Intro_alert(),
                  ));
                },
              ),
              CustomRoundButton(
                backgroundColor: Color.fromRGBO(11, 55, 120, 1),
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
                    builder: (context) => Intro_search(),
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
