import 'package:flutter/material.dart';

class CustomFooterNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabSelected;

  static const List<IconData> icons = [
    Icons.home,
    Icons.notifications,
    Icons.search,
    Icons.person,
  ];
  static const List<String> titles = [
    'Home',
    'Notifications',
    'Search',
    'Profile'
  ];

  static const List<String> routeNames = [
    '/home',
    '/notification',
    '/search',
    '/profile'
  ];

  CustomFooterNavigationBar({
    required this.selectedIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return Container(
      height: h * 0.08,
      decoration: BoxDecoration(
        color: Color.fromRGBO(11, 55, 120, 1),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(217, 217, 217, 0.68).withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (int i = 0; i < icons.length; i++)
            _buildNavBarItem(context, icons[i], routeNames[i], titles[i], i),
        ],
      ),
    );
  }

  Widget _buildNavBarItem(BuildContext context, IconData icon, String routeName,
      String title, int index) {
    return GestureDetector(
      onTap: () {
        onTabSelected(index);
        Navigator.of(context).pushReplacementNamed(routeName);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: selectedIndex == index ? Colors.blue : Colors.white,
          ),
          Text(
            title,
            style: TextStyle(
              color: selectedIndex == index ? Colors.blue : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
