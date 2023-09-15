import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:termomete/services/signUp_func.dart';

import '/widget/Custom_button.dart';
import '/widget/Custom_passwordInput.dart';
import '/widget/Custom_text.dart';
import '/widget/Cutom_inputField.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _conPwdController = TextEditingController();

  bool passwordVisible = false;
  bool rememberMe = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
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
                  image: AssetImage("img/signup.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: h * 0.20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 32.0, right: 150.0),
                    child: CustomText(
                      text: 'Get Started  to Sign Up!',
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
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: h * 0.02,
                      ),
                      Text(
                        "Create your new account",
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
                        validator: (email) =>
                            email != null && !EmailValidator.validate(email)
                                ? 'Enter valid email'
                                : null,
                        controller: _emailController,
                        hintText: 'Email Address',
                        prefixIcon: Icon(
                          Icons.email,
                          color: Color.fromRGBO(11, 55, 120, 1),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      PasswordInput(
                        validator: (pass) => pass!.isEmpty || pass.length < 6
                            ? "Enter valid password"
                            : null,
                        controller: _passwordController,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      PasswordInput(
                        validator: (pass) => pass!.isEmpty ||
                                _emailController.text != _conPwdController.text
                            ? "Password does not match"
                            : null,
                        controller: _conPwdController,
                        hintText: 'Re-enter the Password',
                      ),
                      SizedBox(height: w * 0.05),
                      CustomSquareButton(
                        onTap: () async {
                          if (_emailController.text.isNotEmpty &&
                              _passwordController.text.length > 6) {
                            if (_passwordController.text ==
                                _conPwdController.text) {
                              SignUp signup = SignUp(
                                  contecxt: context,
                                  email: _emailController.text,
                                  password: _passwordController.text);
                              await signup.signUp();
                            } else {
                              debugPrint('Password doesnt match');
                            }
                          } else {
                            debugPrint('Email is empty or Use Strong password');
                          }
                        },
                        buttonText: 'Sign Up',
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
                                'or Sign Up with',
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
                      loginOption(),
                      SizedBox(
                        height: 5,
                      ),
                      SizedBox(height: 2),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account?",
                              style: TextStyle(
                                  color: Colors.grey[500], fontSize: 14),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushReplacementNamed('/signin');
                              },
                              child: Text(
                                "   Login",
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
          ),
        ],
      ),
    );
  }
}
