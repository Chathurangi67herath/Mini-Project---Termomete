import 'package:flutter/material.dart';
import '../screens/home.dart';
import '../screens/notification.dart';
import '../screens/profile.dart';
import '../screens/search.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class CustomFooterNavigationBarNew extends StatefulWidget {
  int? index;
  CustomFooterNavigationBarNew({super.key, required this.index});

  @override
  State<CustomFooterNavigationBarNew> createState() =>
      _CustomFooterNavigationBarNewState();
}

class _CustomFooterNavigationBarNewState
    extends State<CustomFooterNavigationBarNew> {
  final screens = [HomePage(), NotificationPage(), SearchPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    if (widget.index == null) {
      setState(() {
        widget.index = 0;
      });
    }
    return Scaffold(
      body: screens[widget.index!],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            indicatorColor: Colors.blue.shade200,
            labelTextStyle: MaterialStateProperty.all(TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white))),
        child: NavigationBar(
            height: h * 0.08,
            backgroundColor: Color.fromRGBO(11, 55, 120, 1),
            selectedIndex: widget.index!,
            onDestinationSelected: (index) => setState(() {
                  this.widget.index = index;
                }),
            destinations: [
              NavigationDestination(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                label: 'home',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.notifications,
                  color: Colors.white,
                ),
                label: 'notifications',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                label: 'search',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
                label: 'profile',
              ),
            ]),
      ),
    );
  }
}
