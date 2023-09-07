import 'package:flutter/material.dart';
import 'package:termomete/home.dart';
import 'package:termomete/notification.dart';
import 'package:termomete/profile.dart';
import 'package:termomete/search.dart';

class CustomFooterNavigationBarNew extends StatefulWidget {
  const CustomFooterNavigationBarNew({super.key});

  @override
  State<CustomFooterNavigationBarNew> createState() =>
      _CustomFooterNavigationBarNewState();
}

class _CustomFooterNavigationBarNewState
    extends State<CustomFooterNavigationBarNew> {
  int index = 0;
  final screens = [HomePage(), NotificationPage(), SearchPage(), ProfilePage()];
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: screens[index],
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
            selectedIndex: index,
            onDestinationSelected: (index) => setState(() {
                  this.index = index;
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
                label: 'person',
              ),
            ]),
      ),
    );
  }
}
