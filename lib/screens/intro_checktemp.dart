import 'package:flutter/material.dart';
import 'intro_receivealert.dart';
import 'intro_search.dart';
import 'intro_settemp.dart';
import '/widget/Custom_button.dart';
import '/widget/Custom_text.dart';

// ignore: camel_case_types
class Intro_checkTemp extends StatefulWidget {
  const Intro_checkTemp({super.key});

  @override
  State<Intro_checkTemp> createState() => _Intro_checkTempState();
}

// ignore: camel_case_types
class _Intro_checkTempState extends State<Intro_checkTemp> {
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
                image: AssetImage("img/intro_checktemp.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: h * 0.3,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 32.0),
                  child: CustomText(
                    text: 'Check temperature ',
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
              "You can check the temperature in the particular freezer",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Color.fromRGBO(11, 55, 120, 1),
              ),
            ),
          ),
          Column(
            children: [
              SizedBox(height: w * 0.05),
              Image(
                image: AssetImage("img/checktemp.png"),
                width: w * 0.3,
              )
            ],
          ),
          SizedBox(height: w * 0.07),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: w * 0.27,
              ),
              CustomRoundButton(
                backgroundColor: Color.fromRGBO(11, 55, 120, 1),
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
                    builder: (context) => Intro_alert(),
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
