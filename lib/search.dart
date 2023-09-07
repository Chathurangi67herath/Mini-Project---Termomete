import 'package:flutter/material.dart';
import 'package:termomete/widget/freezer_details_card.dart';
import 'widget/Custom_button.dart';
import 'widget/Custom_footerNavBar.dart';
import 'widget/Custom_searchbar.dart';
import 'widget/Custom_text.dart';
import 'widget/Cutom_inputField.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String dropdownvalue = '-Select-';
  List<String> items = [
    '-Select-',
    'Freezer Name',
    'Status of Freezer',
    'Freezer Type'
  ];
  int _selectedIndex = 2;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(11, 55, 120, 1),
        leading: backButton(
          path: '/bnavigation',
        ),
        centerTitle: true,
        title: CustomText(
          text: 'Search',
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
                    editInputTitle(text: 'Select the type   :'),
                    SizedBox(
                      height: h * 0.01,
                    ),
                    Center(
                      child: CustomDropdown(
                        items: items,
                        selectedValue: dropdownvalue,
                        onChanged: (newValue) {
                          setState(() {
                            dropdownvalue = newValue;
                          });
                        },
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Search(),
                      ),
                    ),
                    Container(
                      width: w,
                      child: Column(
                        children: [
                          SizedBox(
                            height: h * 0.02,
                          ),
                          FreezerDetailsCard(w: w, h: h)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
