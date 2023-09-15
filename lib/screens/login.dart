import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:termomete/services/google_sign_in.dart';
import 'package:termomete/services/login_func.dart';

import '/widget/Custom_button.dart';
import '/widget/Custom_passwordInput.dart';
import '/widget/Custom_text.dart';
import '/widget/Cutom_inputField.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool rememberMe = false;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   _emailController.dispose();
  //   _passwordController.dispose();
  //   super.dispose();
  // }

  final formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    final provider = Provider.of<GoogleSignInProvider>(context, listen: false);

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
                  SizedBox(
                    height: h * 0.20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 32.0, right: 150.0),
                    child: CustomText(
                      text: 'Welcome to Termomete',
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
                          final isValid = formKey.currentState!.validate();
                          if (!isValid) return;
                          if (_emailController.text.isNotEmpty &&
                              _passwordController.text.length > 6) {
                            final LoginFunction login = LoginFunction(
                                context: context,
                                email: _emailController.text,
                                password: _passwordController.text);

                            login.login();
                          } else {
                            debugPrint("Email is empty or password is incalid");
                          }
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
                      loginOption(context: context),
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
                                Navigator.of(context)
                                    .pushReplacementNamed('/signup');
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
          ),
        ],
      ),
    );
  }
}
