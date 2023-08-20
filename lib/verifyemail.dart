import 'package:flutter/material.dart';

import 'widget/Custom_button.dart';
import 'widget/Custom_text.dart';
import 'widget/Cutom_inputField.dart';

class VerifyPage extends StatefulWidget {
  const VerifyPage({Key? key}) : super(key: key);

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
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
                  image: AssetImage("img/verify.jpg"),
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
                      text: 'Verify Your Email',
                    ),
                    //),
                  ),
                  SizedBox(
                    height: h * 0.1,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 32.0, right: 150.0),
                    child: CustomText(
                      text: 'Please check your email notification ',
                      fontSize: 13,
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Please enter the 4 digit code  sent to .................",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromRGBO(11, 55, 120, 1),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: h * 0.05,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 100.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          VerifyBox(w: w * 0.1),
                          SizedBox(width: 10),
                          VerifyBox(w: w * 0.1),
                          SizedBox(width: 10),
                          VerifyBox(w: w * 0.1),
                          SizedBox(width: 10),
                          VerifyBox(w: w * 0.1),
                        ],
                      ),
                    ),
                    SizedBox(height: w * 0.1),
                    CustomSquareButton(
                      onTap: () {
                        Navigator.of(context).pushNamed('/newpassword');
                      },
                      buttonText: 'Verify Code',
                    ),
                    SizedBox(height: w * 0.05),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Resent code in",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.fromRGBO(11, 55, 120, 1),
                            ),
                          ),
                          GestureDetector(
                            child: Text(
                              " 00:59",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: w * 0.1),
                    CustomSquareButton(
                      onTap: () {
                        //Navigator.of(context).pushNamed('/signin');
                      },
                      buttonText: 'Resend the Code',
                      buttonColor: Colors.red,
                      fontSize: 20,
                      width: w * 0.4,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
