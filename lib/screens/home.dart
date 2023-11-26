import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:termomete/widget/freezer_details_card.dart';
import '/widget/Custom_footerNavBar.dart';
import '/widget/Custom_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  @override
  initState() {
    super.initState();
    FirebaseMessaging.instance.getToken();
    // When the app is in the foreground and receives a notification.
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Message received when the app is in the foreground:');
      print('Title: ${message.notification?.title}');
      print('Body: ${message.notification?.body}');

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        RemoteNotification? notification = message.notification;
        AndroidNotification? android = message.notification?.android;

        // If `onMessage` is triggered with a notification, we display a dialog with the notification details.
        if (notification != null && android != null) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(notification.title ?? ''),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: [Text(notification.body ?? '')],
                  ),
                ),
                actions: [
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        }
      });
    });
    // When the user taps on a notification and the app is opened.
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('Message opened from system tray:');
      print('Title: ${message.notification?.title}');
      print('Body: ${message.notification?.body}');

      // Add any additional logic for handling the opened notification.
    });
  }

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
          Navigator.pushNamed(context, '/addnew');
        },
        backgroundColor: Color.fromRGBO(11, 55, 120, 1),
      ),
    );
  }
}
