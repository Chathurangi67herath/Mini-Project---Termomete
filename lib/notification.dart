import 'package:flutter/material.dart';
import 'package:termomete/components/freezer_details_card.dart';

import 'freezerdetails.dart';
import 'widget/Custom_button.dart';
import 'widget/Custom_footerNavBar.dart';
import 'widget/Custom_text.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(11, 55, 120, 1),
        leading: backButton(),
        centerTitle: true,
        title: CustomText(
          text: 'Notification',
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            color: Colors.white,
            onPressed: () {
              Navigator.of(context).pushNamed('/setting');
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(244, 246, 254, 1),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: h * 0.05,
                    ),
                    Container(
                        width: w,
                        height: h * 0.04,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(11, 55, 120, 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Today',
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                    FreezerDetailsCard(w: w, h: h)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomFooterNavigationBar(),
    );
  }
}
