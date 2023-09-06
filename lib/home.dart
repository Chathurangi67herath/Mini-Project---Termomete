import 'package:flutter/material.dart';
import 'package:termomete/widget/freezer_details_card.dart';
import 'widget/Custom_footerNavBar.dart';
import 'widget/Custom_text.dart';

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
      body: Column(
        children: [
          Container(
            height: h * 0.32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40.0),
                bottomRight: Radius.circular(40.0),
              ),
              image: DecorationImage(
                image: AssetImage("img/Home.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: h * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'img/logo.png',
                      width: 150,
                      height: 70,
                    ),
                    IconButton(
                      icon: Icon(Icons.settings),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.of(context).pushNamed('/setting');
                      },
                    ),
                  ],
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
          FreezerDetailsCard(w: w, h: h),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, color: Colors.white),
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/addnew');
        },
        backgroundColor: Color.fromRGBO(11, 55, 120, 1),
      ),
      bottomNavigationBar: CustomFooterNavigationBar(),
    );
  }
}
