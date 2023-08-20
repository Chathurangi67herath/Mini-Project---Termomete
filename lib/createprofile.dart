//import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'widget/Custom_button.dart';
import 'widget/Custom_text.dart';
import 'widget/Cutom_inputField.dart';

class CprofilePage extends StatefulWidget {
  const CprofilePage({Key? key}) : super(key: key);

  @override
  State<CprofilePage> createState() => _CprofilePageState();
}

class _CprofilePageState extends State<CprofilePage> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            width: w,
            height: h * 0.40,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("img/cprofile.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      backButton(),
                    ],
                  ),
                  Positioned(
                    child: CustomText(
                      text: 'Create Profile',
                    ),
                    //),
                  ),
                  SizedBox(
                    height: 25.0,
                  ),
                  Positioned.fill(
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed('/signout');
                        },
                        child: Icon(
                          Icons.camera_alt,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: Text(
                      "Choose a cover photo",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                    //),
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
                      height: h * 0.18,
                    ),
                    inputField(
                      hintText: 'First Name',
                      prefixIcon: Icon(
                        Icons.person,
                        color: Color.fromRGBO(11, 55, 120, 1),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    inputField(
                      hintText: 'Last Name',
                      prefixIcon: Icon(
                        Icons.person,
                        color: Color.fromRGBO(11, 55, 120, 1),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    inputField(
                      hintText: 'Phone Number',
                      prefixIcon: Icon(
                        Icons.call,
                        color: Color.fromRGBO(11, 55, 120, 1),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    inputField(
                      hintText: 'Address',
                      prefixIcon: Icon(
                        Icons.location_on,
                        color: Color.fromRGBO(11, 55, 120, 1),
                      ),
                    ),
                    SizedBox(height: w * 0.1),
                    CustomSquareButton(
                      onTap: () {
                        Navigator.of(context).pushNamed('/home');
                      },
                      buttonText: 'Set Profile',
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: h * 0.32 - 5 - 70 / 1,
            left: w / 4 - 70 / 1,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 70,
                    backgroundColor: Color.fromRGBO(118, 113, 113, 0.5),
                  ),
                ),
                Positioned.fill(
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed('/home');
                      },
                      child: Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.camera_alt,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 40,
                  left: 0,
                  right: 0,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Choose an image",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
