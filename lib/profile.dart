import 'package:flutter/material.dart';

import 'widget/Custom_button.dart';
import 'widget/Custom_text.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Profile information
  String _firstName = "John";
  String _lastName = "Doe";
  String _phoneNumber = "123-456-7890";
  String _address = "123 Main St, City";

  String _profileImage = 'img/profile.jpg';
  String _coverPhoto = 'img/profilecover.jpg';

  // Text editing controllers for editing mode
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  // Editing mode flag
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _firstNameController.text = _firstName;
    _lastNameController.text = _lastName;
    _phoneNumberController.text = _phoneNumber;
    _addressController.text = _address;
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneNumberController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _toggleEditing() {
    setState(() {
      _isEditing = !_isEditing;
    });
  }

  void _saveChanges() {
    setState(() {
      _firstName = _firstNameController.text;
      _lastName = _lastNameController.text;
      _phoneNumber = _phoneNumberController.text;
      _address = _addressController.text;
      _toggleEditing();
    });
  }

  String getFullName() {
    return "$_firstName $_lastName";
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            height: h,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  width: w,
                  height: h * 0.40,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(_coverPhoto),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            backButton(
                              path: '/bnavigation',
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
                        Positioned(
                          child: CustomText(
                            text: _isEditing ? "Edit Profile" : "Profile",
                          ),
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        Visibility(
                          visible: _isEditing,
                          child: Positioned.fill(
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed('/signout');
                                },
                                child: Icon(Icons.camera_alt,
                                    size: 40, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: _isEditing,
                          child: Positioned(
                            child: Text(
                              "Choose a cover photo",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                            //),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: h * 0.30 - 5,
                  left: 0,
                  width: w,
                  height: 700 + 5,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Color.fromRGBO(244, 246, 254, 1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: h * 0.16,
                          ),
                          Column(
                            children: [
                              editInputTitle(
                                  text: 'First Name', icon: Icons.person),
                              _isEditing
                                  ? TextFormField(
                                      controller: _firstNameController,
                                      decoration: InputDecoration(
                                        hintText: 'Enter your first name',
                                        hintStyle: TextStyle(),
                                        border: InputBorder.none,
                                      ),
                                    )
                                  : Row(
                                      children: [
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Text(_firstName),
                                      ],
                                    ),
                              Divider(
                                color: Color.fromRGBO(118, 113, 113, 1),
                                thickness: 1.0,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            children: [
                              editInputTitle(
                                  text: 'Last Name', icon: Icons.person),
                              _isEditing
                                  ? TextFormField(
                                      controller: _lastNameController,
                                      decoration: InputDecoration(
                                        hintText: 'Enter your last name',
                                        hintStyle: TextStyle(),
                                        border: InputBorder.none,
                                      ),
                                    )
                                  : Row(
                                      children: [
                                        SizedBox(width: 30),
                                        Text(_lastName),
                                      ],
                                    ),
                              Divider(
                                color: Color.fromRGBO(118, 113, 113, 1),
                                thickness: 1.0,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            children: [
                              editInputTitle(
                                  text: 'Phone Number', icon: Icons.call),
                              _isEditing
                                  ? TextFormField(
                                      controller: _phoneNumberController,
                                      decoration: InputDecoration(
                                        hintText: 'Enter your phone number',
                                        hintStyle: TextStyle(),
                                        border: InputBorder.none,
                                      ),
                                    )
                                  : Row(
                                      children: [
                                        SizedBox(width: 30),
                                        Text(_phoneNumber),
                                      ],
                                    ),
                              Divider(
                                color: Color.fromRGBO(118, 113, 113, 1),
                                thickness: 1.0,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Column(
                            children: [
                              editInputTitle(
                                  text: 'Address', icon: Icons.location_on),
                              _isEditing
                                  ? TextFormField(
                                      controller: _addressController,
                                      decoration: InputDecoration(
                                        hintText: 'Enter your address',
                                        hintStyle: TextStyle(),
                                        border: InputBorder.none,
                                      ),
                                    )
                                  : Row(
                                      children: [
                                        SizedBox(width: 30),
                                        Text(_address),
                                      ],
                                    ),
                              Divider(
                                color: Color.fromRGBO(118, 113, 113, 1),
                                thickness: 1.0,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomSquareButton(
                            onTap: () {
                              if (_isEditing) {
                                _saveChanges();
                              } else {
                                _toggleEditing();
                              }
                            },
                            buttonText:
                                _isEditing ? "Set Profile" : "Edit Profile",
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: h * 0.32 - 5 - 70 / 1,
                  left: w / 4 - 70 / 1,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 70,
                          backgroundImage: AssetImage(_profileImage),
                        ),
                      ),
                      Visibility(
                        visible: _isEditing,
                        child: Positioned.fill(
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed('/signout');
                              },
                              child: Align(
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.camera_alt_rounded,
                                  size: 40,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _isEditing,
                        child: Positioned(
                          bottom: 40,
                          left: 0,
                          right: 0,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Choose an image",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: h * 0.43 - 5 - 70 / 1,
                  left: w - 200,
                  child: Text(
                    getFullName(),
                    style: TextStyle(
                      fontFamily: 'Poppins-Bold',
                      color: Color.fromRGBO(11, 55, 120, 1),
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
