import 'package:flutter/material.dart';
import 'package:termomete/services/logOut_func.dart';

import '/widget/Custom_button.dart';
import '/widget/Custom_footerNavBar.dart';
import '/widget/Custom_text.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  int _selectedIndex = 4;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    List<Map<String, dynamic>> itemList = [
      {
        'name': 'Change Password',
        'route': '/cpassword',
        'icon': Icons.lock, // Add the icon for 'Change Password'
      },
      {
        'name': 'Edit Profile',
        'route': '/profile',
        'icon': Icons.person,
      },
      {
        'name': 'Language',
        'route': '/language',
        'icon': Icons.language,
      },
      // {
      //   'name': 'Privacy Policy',
      //   'route': '/privacy',
      //   'icon': Icons.privacy_tip,
      // },
      {
        'name': 'About Us',
        'route': '/about',
        'icon': Icons.info,
      },
      {
        'name': 'Help',
        'route': '/help',
        'icon': Icons.help,
      },
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(11, 55, 120, 1),
        leading: backButton(
          path: '/bnavigation',
        ),
        centerTitle: true,
        title: CustomText(
          text: 'Setting',
        ),
        actions: [
          closebutton(),
        ],
      ),
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
                      height: h * 0.05,
                    ),
                    Container(
                      width: w,
                      height: h * 0.15,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(217, 217, 217, 0.68),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: w * 0.06,
                          ),
                          Container(
                            width: w * 0.18,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed('/profile');
                              },
                              child: CircleAvatar(
                                radius: 70,
                                backgroundImage: AssetImage('img/profile.png'),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: w * 0.1,
                          ),
                          editInputTitle(
                            text: 'User Name',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                itemCount: itemList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final itemName = itemList[index]['name'];
                                  final itemRoute = itemList[index]['route'];
                                  final itemIcon = itemList[index]['icon'];

                                  return Container(
                                    decoration: BoxDecoration(
                                      color:
                                          Color.fromRGBO(240, 239, 240, 0.675),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color.fromRGBO(0, 0, 0, 0.678)
                                              .withOpacity(0.2),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                      border: Border(
                                          bottom:
                                              BorderSide(color: Colors.grey)),
                                    ),
                                    child: ListTile(
                                      leading: Container(
                                        width: 35, // Adjust the size here
                                        height: 35, // Adjust the size here
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Color.fromRGBO(11, 55, 120, 1),
                                          border: Border.all(
                                              color: Colors.white,
                                              width: 2), // Add white border
                                        ),
                                        child: Center(
                                          child: Icon(
                                            itemIcon,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                      title: Text(itemName),
                                      trailing: Icon(Icons.arrow_forward_ios),
                                      onTap: () {
                                        Navigator.of(context)
                                            .pushNamed(itemRoute);
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: h * 0.06,
            left: 0,
            right: 0,
            child: Center(
              child: CustomSquareButton(
                onTap: () {
                  SignOut(context: context).signOut();
                },
                buttonText: 'Sign Out',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
