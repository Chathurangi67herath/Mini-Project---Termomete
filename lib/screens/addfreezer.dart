import 'dart:math';

import 'package:flutter/material.dart';

import '/widget/Custom_button.dart';
import '/widget/Custom_text.dart';
import '/widget/Cutom_inputField.dart';

class AddFreezerPage extends StatefulWidget {
  const AddFreezerPage({Key? key}) : super(key: key);

  @override
  State<AddFreezerPage> createState() => _AddFreezerPageState();
}

class _AddFreezerPageState extends State<AddFreezerPage> {
  TextEditingController _freezerName = TextEditingController();
  TextEditingController _items = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _freezerName.dispose();
    _items.dispose();
    // TODO: implement dispose
    super.dispose();
  }

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
        leading: backButton(path: '/bnavigation'),
        centerTitle: true,
        title: CustomText(
          text: 'Add New Freezer',
        ),
        actions: [
          closebutton(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              // SizedBox(
              //   height: h * 0.05,
              // ),
              editInputTitle(text: 'Freezer Name   :'),
              SizedBox(
                height: h * 0.01,
              ),
              inputField(
                validator: (name) =>
                    name!.isEmpty ? 'enter freezer name' : null,
                controller: _freezerName,
                hintText: '',
              ),
              SizedBox(
                height: h * 0.03,
              ),
              editInputTitle(text: 'Type   :'),
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
              SizedBox(
                height: h * 0.03,
              ),
              editInputTitle(text: 'Temperature Range   :'),
              SizedBox(
                height: h * 0.01,
              ),
              MultiRangeSliderWithButtons(
                minValue: 0.0,
                maxValue: 100.0,
                initialStartValue: 20.0,
                initialEndValue: 80.0,
              ),
              SizedBox(
                height: h * 0.03,
              ),
              editInputTitle(text: 'Items included   :'),
              SizedBox(
                height: h * 0.01,
              ),
              inputField(
                validator: (items) {
                  if (items!.isEmpty) {
                    return 'enter items';
                  } else
                    return null;
                },
                controller: _items,
                hintText: '',
                maxLines: 3,
              ),
              SizedBox(
                height: h * 0.05,
              ),
              CustomSquareButton(
                onTap: () {
                  final isValid = formKey.currentState!.validate();
                  if (!isValid) return;
                  Navigator.of(context).pushNamed('/home');
                },
                buttonText: 'Save',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
