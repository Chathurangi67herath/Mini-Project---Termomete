import 'package:flutter/material.dart';

import 'widget/Custom_button.dart';
import 'widget/Custom_passwordInput.dart';
import 'widget/Custom_text.dart';

class NewpasswordPage extends StatefulWidget {
  const NewpasswordPage({Key? key}) : super(key: key);

  @override
  State<NewpasswordPage> createState() => _NewpasswordPageState();
}

class _NewpasswordPageState extends State<NewpasswordPage> {
  bool passwordVisible = false;
  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

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
                  image: AssetImage("img/newpassword.jpg"),
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
                      text: 'Create New Password',
                    ),

                    //),
                  ),
                  SizedBox(
                    height: h * 0.1,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 32.0, right: 150.0),
                    child: CustomText(
                      text: 'Please create your new password ',
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
                        "Please enter your current passowrd and new password  ",
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
                    PasswordInput(
                      hintText: 'Current Password',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    PasswordInput(
                      hintText: 'New Password',
                    ),
                    SizedBox(height: w * 0.1),
                    CustomSquareButton(
                      onTap: () {
                        Navigator.of(context).pushNamed('/successchange');
                      },
                      buttonText: 'Send',
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
