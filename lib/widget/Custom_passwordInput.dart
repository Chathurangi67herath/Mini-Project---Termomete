import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  String? hintText;

  PasswordInput({
    this.hintText, // Default hint text is "Password"
    Key? key,
  }) : super(key: key);

  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool passwordVisible = false;

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
        color: Color.fromRGBO(217, 217, 217, 0.68),
        borderRadius: BorderRadius.circular(20),
      ),
      width: 450,
      child: TextField(
        obscureText: passwordVisible,
        decoration: InputDecoration(
          hintText: 'jjjjjjj',
          hintStyle: TextStyle(
            // fontFamily: 'Poppins-Bold',
            color: Color.fromRGBO(11, 55, 120, 1),
          ),
          prefixIcon: Icon(
            Icons.lock,
            color: Color.fromRGBO(11, 55, 120, 1),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.white, width: 1.0)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(
                  color: Color.fromRGBO(217, 217, 217, 0.68), width: 1.0)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          suffixIcon: IconButton(
            icon:
                Icon(passwordVisible ? Icons.visibility : Icons.visibility_off),
            color: Color.fromRGBO(11, 55, 120, 1),
            onPressed: () {
              setState(
                () {
                  passwordVisible = !passwordVisible;
                },
              );
            },
          ),
          alignLabelWithHint: false,
          filled: true,
        ),
        keyboardType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.done,
      ),
    );
  }
}
