import 'package:flutter/material.dart';

import 'widget/Custom_button.dart';
import 'widget/Custom_footerNavBar.dart';
import 'widget/Custom_passwordInput.dart';
import 'widget/Custom_text.dart';
import 'widget/Cutom_inputField.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
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
            height: h,
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(244, 246, 254, 1),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: h * 0.4,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            width: w,
            height: h * 0.30,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0),
                ),
                image: DecorationImage(
                  image: AssetImage("img/home.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: h * 0.03,
                  ),
                  Image.asset(
                    'img/logo.png',
                    width: 150,
                    height: 70,
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 32.0),
                    child: CustomText(
                      text: 'Keep things cool & worry free! ',
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 32.0),
                    child: Text(
                      'Enjoy monitoring',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.01,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 32.0),
                    child: Text(
                      'your freezer temperature effortlessly',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: IconButton(
              icon: Icon(Icons.settings),
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).pushNamed('/setting');
              },
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/addnew');
              },
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(11, 55, 120, 1),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color:
                          Color.fromRGBO(217, 217, 217, 0.68).withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(Icons.add, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomFooterNavigationBar(
        selectedIndex: _selectedIndex,
        onTabSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
