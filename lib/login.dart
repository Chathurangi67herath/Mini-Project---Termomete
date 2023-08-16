//import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'widget/Custom_button.dart';
import 'widget/Custom_passwordInput.dart';
import 'widget/Custom_text.dart';
import 'widget/Cutom_inputField.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    //List images = ["google.png", "twitter.png", "fb.png"];
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
                  image: AssetImage("img/loging.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  backButton(),
                  SizedBox(
                    height: h * 0.10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 32.0, right: 150.0),
                    child: CustomText(
                      text: 'Welcome back Termomete',
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
                      height: h * 0.02,
                    ),
                    Text(
                      "Login to your account",
                      style: TextStyle(
                        color: Color.fromRGBO(118, 113, 113, 1),
                        fontSize: 20,
                        fontFamily: 'Poppins-Bold',
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    inputField(
                      hintText: 'Email Address',
                      prefixIcon: Icon(
                        Icons.email,
                        color: Color.fromRGBO(11, 55, 120, 1),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    PasswordInput(),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: rememberMe,
                          onChanged: (newValue) {
                            rememberMe = newValue!;
                          },
                          shape: CircleBorder(),
                          activeColor: Colors.blue,
                          side: BorderSide(color: Colors.blue),
                        ),
                        Text(
                          "Remember me",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.blueAccent,
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushNamed('/cpassword');
                          },
                          child: Text(
                            "Forget Password?",
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: w * 0.05),
                    CustomSquareButton(
                      onTap: () {
                        Navigator.of(context).pushNamed('/cprofile');
                      },
                      buttonText: 'Login',
                    ),
                    SizedBox(height: w * 0.03),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Divider(
                              color: Color.fromRGBO(118, 113, 113, 1),
                              thickness: 1.0,
                              indent: 25.0,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              'or Login with',
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Color.fromRGBO(118, 113, 113, 1),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              color: Color.fromRGBO(118, 113, 113, 1),
                              thickness: 1.0,
                              endIndent: 25.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: w * 0.03),
                    loginOption(
                        images: ["google.png", "twitter.png", "fb.png"]),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(height: 2),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don’t have account?",
                            style: TextStyle(
                                color: Colors.grey[500], fontSize: 14),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed('/signup');
                            },
                            child: Text(
                              "   Sign Up",
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
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
