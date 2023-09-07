import 'package:flutter/material.dart';

import 'widget/Custom_button.dart';
import 'widget/Custom_measure.dart';
import 'widget/Custom_text.dart';
import 'widget/Cutom_inputField.dart';

class FreezerDetails extends StatefulWidget {
  const FreezerDetails({Key? key}) : super(key: key);

  @override
  State<FreezerDetails> createState() => _FreezerDetailsState();
}

class _FreezerDetailsState extends State<FreezerDetails> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: h,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                width: w,
                height: h * 0.40,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("img/fdetails.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          backButton(
                            path: '/home',
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 300, top: 20.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: IconButton(
                                icon: Icon(Icons.edit),
                                color: Color.fromRGBO(11, 55, 120, 1),
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed('/editfreezerdetails');

                                  // Add your edit button's onPressed functionality here
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: h * 0.08,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 32.0, right: 150.0),
                        child: CustomText(
                          text: 'Vertical Deep Freezer 500L',
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: h * 0.30 - 5,
                left: 0,
                width: w,
                height: 700 + 5,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Color.fromRGBO(244, 246, 254, 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: h * 0.05,
                        ),
                        SizedBox(
                          width: 110,
                          height: 110,
                          child: CustomPaint(
                            painter: TemperatureLimitPainter(
                                temperature: 20, maxTemperature: 30),
                          ),
                        ),
                        SizedBox(
                          height: h * 0.02,
                        ),
                        Row(
                          children: [
                            editInputTitle(text: 'Type   :'),
                            SizedBox(
                              width: w * 0.05,
                            ),
                            detailsview(
                              width: w * 0.63,
                              text: 'Uplight Freezer ',
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h * 0.02,
                        ),
                        Row(
                          children: [
                            editInputTitle(text: 'Temp Range   :'),
                            SizedBox(
                              width: w * 0.05,
                            ),
                            detailsview(
                              text: '-0.4°F to -11.2°F ',
                              width: w * 0.47,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h * 0.02,
                        ),
                        Column(
                          children: [
                            editInputTitle(text: 'Items included   :'),
                            SizedBox(
                              height: h * 0.01,
                            ),
                            detailsview(
                              width: w * 0.8,
                              height: h * 0.07,
                              text: 'Vegetables, Fruits ',
                            ),
                          ],
                        ),
                        SizedBox(
                          height: h * 0.03,
                        ),
                        detailsview(
                          width: w * 0.9,
                          height: h * 0.15,
                          text: 'Current Temperature is ',
                          additionalText: 'High',
                          color: Color.fromRGBO(11, 55, 120, 1),
                          textColor: Colors.white,
                          textSize: 20,
                          emoji: '😑',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
