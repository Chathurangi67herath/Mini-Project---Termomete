import 'package:flutter/material.dart';

import 'widget/Custom_button.dart';
import 'widget/Custom_footerNavBar.dart';
import 'widget/Custom_text.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  int _selectedIndex = 4;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(11, 55, 120, 1),
        leading: backButton(),
        centerTitle: true,
        title: CustomText(
          text: 'About Us',
        ),
        actions: [
          closebutton(),
        ],
      ),
      body: Stack(children: [
        Positioned(
          top: 0,
          left: 0,
          width: w,
          height: h,
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(244, 246, 254, 1),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: h * 0.08,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Termomete is the temperature monitoring application of the super market freezer.   ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromRGBO(11, 55, 120, 1),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.04,
                  ),
                  Container(
                    width: w * 0.9,
                    height: h * 0.35,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(217, 217, 217, 0.68),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: Color.fromRGBO(187, 187, 187, 0.678),
                                  width: 2), // Add border properties here
                            ),
                            child: CircleAvatar(
                              backgroundImage: AssetImage('img/logo.png'),
                              backgroundColor: Colors.white,
                              radius: 50,
                            ),
                          ),
                          SizedBox(
                            height: h * 0.15,
                          ),
                          Container(
                            width: w * 0.6,
                            height: h * 0.13,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(11, 55, 120, 1),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  Text(
                                    "Contact Us",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                    ),
                                  ),
                                  SizedBox(
                                    height: h * 0.03,
                                  ),
                                  Text(
                                    "We are undergraduates of the Sabaragamuwa University of Sri Lanka ",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                    ),
                                  ),
                                  SizedBox(
                                    height: h * 0.01,
                                  ),
                                  Text(
                                    "Faculty of Computing - Department of Computing & Information Systems ( 2018/2019 Batch) ",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: h * 0.07,
                          ),
                          Container(
                            width: w * 0.7,
                            height: h * 0.15,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(11, 55, 120, 1),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  Text(
                                    "Contact Us",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                    ),
                                  ),
                                  SizedBox(
                                    height: h * 0.01,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      // launch('mailto:termometeminiproject@gmail.com');
                                    },
                                    child: Text(
                                      "Email: termometeminiproject@gmail.com",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Color.fromRGBO(255, 255, 255, 1),
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ]),
    );
  }
}
