import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '/widget/Custom_button.dart';
import '/widget/Custom_text.dart';
import '/widget/Cutom_inputField.dart';

class CpasswordPage extends StatefulWidget {
  const CpasswordPage({Key? key}) : super(key: key);

  @override
  State<CpasswordPage> createState() => _CpasswordPageState();
}

class _CpasswordPageState extends State<CpasswordPage> {
  TextEditingController _email = TextEditingController();
  TextEditingController _items = TextEditingController();
  @override
  void dispose() {
    _email.dispose();
    _items.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();
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
                  image: AssetImage("img/cpassword.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        backButton(
                          path: '/settings',
                        ),
                      ],
                    ),
                    Positioned(
                      child: CustomText(
                        text: 'Change Password',
                      ),
                      //),
                    ),
                    SizedBox(
                      height: h * 0.1,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 32.0, right: 150.0),
                      child: CustomText(
                        text: 'If you want to change your password ',
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
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
                        "Please enter your email address to receive a verification code  ",
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
                    inputField(
                      validator: (email) =>
                          email != null && !EmailValidator.validate(email)
                              ? 'Enter valid email'
                              : null,
                      // validator: (name) => name == null ? 'enter freezer name': null ,
                      controller: _email,
                      hintText: 'Enter Your Email Address',
                      prefixIcon: Icon(
                        Icons.email,
                        color: Color.fromRGBO(11, 55, 120, 1),
                      ),
                    ),
                    SizedBox(height: w * 0.1),
                    CustomSquareButton(
                      onTap: () {
                        final isValid = formKey.currentState!.validate();
                        if (!isValid) return;
                        Navigator.of(context).pushNamed('/verify');
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
