import 'package:flutter/material.dart';
import 'intro_checktemp.dart';
import 'intro_receivealert.dart';
import 'intro_settemp.dart';
import 'landing.dart';
import '/widget/Custom_button.dart';
import '/widget/Custom_text.dart';

// ignore: camel_case_types
class Intro_search extends StatefulWidget {
  const Intro_search({super.key});

  @override
  State<Intro_search> createState() => _Intro_searchState();
}

// ignore: camel_case_types
class _Intro_searchState extends State<Intro_search> {
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
                image: AssetImage("img/intro_search.jpg"),
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
                    text: 'Search all',
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
              "You can see temperature state in all freezers from one page ",
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
                image: AssetImage("img/search.png"),
                width: w * 0.45,
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
                    builder: (context) => Intro_settemp(),
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
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Intro_settemp(),
                  ));
                },
              ),
              CustomRoundButton(
                backgroundColor: Color.fromRGBO(11, 55, 120, 1),
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
                    builder: (context) => LandingPage(),
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
