import 'package:flutter/material.dart';
import 'package:termomete/widget/Custom_button.dart';

import '/widget/Custom_text.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset(
              'img/landing.jpg',
              width: w,
              height: h,
              fit: BoxFit.cover,
            ),
            Container(
              width: w,
              height: h,
              child: Column(
                children: [
                  SizedBox(
                    height: h * 0.65,
                  ),
                  CustomSquareButton(
                    w: w * 0.4,
                    h: h * 0.065,
                    onTap: () {
                      Navigator.of(context).pushNamed('/signup');
                    },
                    buttonText: 'Sign Up',
                    buttonColor: Color.fromRGBO(0, 0, 0, 0.41),
                    width: w * 0.4,
                  ),
                  SizedBox(
                    height: h * 0.03,
                  ),
                  CustomSquareButton(
                    w: w * 0.4,
                    h: h * 0.065,
                    onTap: () {
                      Navigator.of(context).pushNamed('/signin');
                    },
                    buttonText: 'Login',
                    width: w * 0.4,
                  ),
                  SizedBox(height: w * 0.1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // CustomRoundButton(),
                      // CustomRoundButton(),
                      // CustomRoundButton(),
                      // CustomRoundButton(),
                      // CustomRoundButton(),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/introsearch');
              },
              padding: EdgeInsets.only(
                left: 20.0,
              ),
            ),
            Positioned(
              top: 50,
              left: 30,
              child: Image.asset(
                'img/logo.png',
                width: 150,
                height: 200,
              ),
            ),
            Positioned(
              top: 250,
              left: 45,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Let’s Start the',
                    fontSize: 24,
                  ),
                  SizedBox(height: 10),
                  CustomText(
                    text: 'Journey',
                    fontSize: 24,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
