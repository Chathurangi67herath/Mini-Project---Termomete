import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PasswordInput extends StatefulWidget {
  String? hintText;
  final TextEditingController controller;

  PasswordInput({
    required this.controller,
    this.hintText,
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
  void dispose() {
    widget.controller.dispose();
    // TODO: implement dispose
    super.dispose();
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
        controller: widget.controller,
        obscureText: passwordVisible,
        decoration: InputDecoration(
          labelText: widget.hintText ?? 'Password',
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
