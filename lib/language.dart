import 'package:flutter/material.dart';

import 'widget/Custom_button.dart';
import 'widget/Custom_footerNavBar.dart';
import 'widget/Custom_text.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  State<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends State<LanguagePage> {
  String selectedLanguage = '';
  int _selectedIndex = 4;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(11, 55, 120, 1),
        leading: backButton(
          path: '/setting',
        ),
        centerTitle: true,
        title: CustomText(
          text: 'Language',
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
                        "Select one Language  ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromRGBO(11, 55, 120, 1),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: h * 0.04,
                    ),
                    Container(
                      width: w * 0.5,
                      height: h * 0.4,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(217, 217, 217, 0.68),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            RadioListTile<String>(
                              title: Text('Sinhala'),
                              value: 'Sinhala',
                              groupValue: selectedLanguage,
                              onChanged: (value) {
                                setState(() {
                                  selectedLanguage = value!;
                                });
                              },
                            ),
                            RadioListTile<String>(
                              title: Text('English'),
                              value: 'English',
                              groupValue: selectedLanguage,
                              onChanged: (value) {
                                setState(() {
                                  selectedLanguage = value!;
                                });
                              },
                            ),
                            RadioListTile<String>(
                              title: Text('Tamil'),
                              value: 'Tamil',
                              groupValue: selectedLanguage,
                              onChanged: (value) {
                                setState(() {
                                  selectedLanguage = value!;
                                });
                              },
                            ),
                            SizedBox(height: h * 0.02),
                            CustomSquareButton(
                                width: w * 0.3,
                                height: 40,
                                onTap: () {
                                  Navigator.of(context).pushNamed('/cprofile');
                                },
                                buttonText: 'Save')
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
