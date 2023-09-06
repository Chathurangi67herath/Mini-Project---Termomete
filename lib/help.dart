import 'package:flutter/material.dart';
import 'package:termomete/widget/Cutom_inputField.dart';

import 'widget/Custom_button.dart';
import 'widget/Custom_footerNavBar.dart';
import 'widget/Custom_text.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  TextEditingController _name = TextEditingController();
  TextEditingController _contact = TextEditingController();
  TextEditingController _problem = TextEditingController();
  @override
  void dispose() {
    _name.dispose();
    _contact.dispose();
    _problem.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  int _selectedIndex = 4;
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
          text: 'Help',
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
                      height: h * 0.08,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "If you want a help or clarify any thing, you can add it and then we will contact you.  ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromRGBO(11, 55, 120, 1),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: h * 0.02,
                    ),
                    Container(
                      width: w * 0.65,
                      height: h * 0.57,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(217, 217, 217, 0.68),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(50.0),
                        child: Column(
                          children: [
                            inputField(
                                controller: _name, hintText: 'Your Name'),
                            SizedBox(
                              height: h * 0.01,
                            ),
                            inputField(
                                controller: _contact,
                                hintText: 'Contact Number Or Email Address'),
                            SizedBox(
                              height: h * 0.01,
                            ),
                            inputField(
                              controller: _problem,
                              hintText: 'Your Problem',
                              maxLines: 3,
                            ),
                            SizedBox(
                              height: h * 0.03,
                            ),
                            CustomSquareButton(
                                width: w * 0.4,
                                height: 40,
                                onTap: () {
                                  Navigator.of(context).pushNamed('/cprofile');
                                },
                                buttonText: 'Send')
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
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
