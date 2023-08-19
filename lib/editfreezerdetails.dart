import 'package:flutter/material.dart';

import 'widget/Custom_button.dart';
import 'widget/Custom_text.dart';
import 'widget/Cutom_inputField.dart';

class EditFreezerPage extends StatefulWidget {
  const EditFreezerPage({Key? key}) : super(key: key);

  @override
  State<EditFreezerPage> createState() => _EditFreezerPageState();
}

class _EditFreezerPageState extends State<EditFreezerPage> {
  String dropdownvalue = 'Option 1';
  List<String> items = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];
  @override
  Widget build(BuildContext context) {
    //double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 246, 254, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(11, 55, 120, 1),
        leading: backButton(),
        centerTitle: true,
        title: CustomText(
          text: 'Edit Freezer Details',
        ),
        actions: [
          closebutton(),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: h * 0.05,
          ),
          editInputTitle(text: 'Freezer Name   :'),
          SizedBox(
            height: h * 0.02,
          ),
          inputField(
            hintText: '',
          ),
          SizedBox(
            height: h * 0.05,
          ),
          editInputTitle(text: 'Type   :'),
          SizedBox(
            height: h * 0.02,
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
          SizedBox(
            height: h * 0.05,
          ),
          editInputTitle(text: 'Temperature Range   :'),
          SizedBox(
            height: h * 0.02,
          ),
          MultiRangeSliderWithButtons(
            minValue: 0.0,
            maxValue: 100.0,
            initialStartValue: 20.0,
            initialEndValue: 80.0,
          ),
          SizedBox(
            height: h * 0.05,
          ),
          editInputTitle(text: 'Items included   :'),
          SizedBox(
            height: h * 0.02,
          ),
          inputField(
            hintText: '',
          ),
          SizedBox(
            height: h * 0.07,
          ),
          CustomSquareButton(
            onTap: () {
              Navigator.of(context).pushNamed('/cprofile');
            },
            buttonText: 'Save Edited Details',
          ),
        ],
      ),
    );
  }
}
