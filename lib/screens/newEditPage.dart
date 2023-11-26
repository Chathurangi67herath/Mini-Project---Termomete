import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:termomete/model/user.dart';
import 'package:termomete/services/add_data.dart';
import 'package:termomete/services/create_user.dart';
import 'package:termomete/services/update_user.dart';
import 'package:termomete/utils.dart';
import 'package:termomete/widget/Custom_footerNavBar.dart';
import 'package:termomete/widget/navigation.dart';

import '/widget/Custom_button.dart';
import '/widget/Custom_text.dart';

class NewProfilePage extends StatefulWidget {
  UserDetails? userDetails;
  NewProfilePage({Key? key, this.userDetails}) : super(key: key);

  @override
  State<NewProfilePage> createState() => _NewProfilePageState();
}

class _NewProfilePageState extends State<NewProfilePage> {
  // Profile information
  // String _firstName = "John";
  // String _lastName = "Doe";
  // String _phoneNumber = "123-456-7890";
  // String _address = "123 Main St, City";

  String _profileImage =
      'https://firebasestorage.googleapis.com/v0/b/termomete-41240.appspot.com/o/profile.png?alt=media&token=e67b9031-e075-4306-bf38-8a339b00416a';
  String _coverPhoto =
      'https://firebasestorage.googleapis.com/v0/b/termomete-41240.appspot.com/o/profilecover.jpg?alt=media&token=1ec12e3c-3b2b-4655-9f31-a76359dafd63';

  // Text editing controllers for editing mode
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  //TextEditingController _addressController = TextEditingController();

  // Editing mode flag
  // bool _isEditing = false;
  var currentUser;
  @override
  void initState() {
    super.initState();
    _firstNameController.text = widget.userDetails!.fname!;
    _lastNameController.text = widget.userDetails!.lname!;
    _phoneNumberController.text = widget.userDetails!.phoneNum!;
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneNumberController.dispose();

    super.dispose();
  }

  Uint8List? _profImage;
  Uint8List? _backImage;
  void selectImageProf() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _profImage = img;
    });
  }

  void selectImageBack() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _backImage = img;
    });
  }

  bool _isloading = false;
  String? imgurlProf;
  String? imgurlBack;
  void saveData(data) async {
    setState(() {
      _isloading = true;
    });
    try {
      if (_profImage != null && _backImage != null) {
        imgurlProf = await StoreData()
            .uploadImageToStorage('pro' + widget.userDetails!.id!, _profImage!);
        imgurlBack = await StoreData().uploadImageToStorage(
            'back' + widget.userDetails!.id!, _backImage!);
      } else if (_profImage == null && _backImage != null) {
        imgurlProf = widget.userDetails!.profUrl;
        imgurlBack = await StoreData().uploadImageToStorage(
            'back' + widget.userDetails!.id!, _backImage!);
      } else if (_profImage != null && _backImage == null) {
        imgurlBack = widget.userDetails!.backUrl;
        imgurlProf = await StoreData().uploadImageToStorage(
            'back' + widget.userDetails!.id!, _profImage!);
      } else {
        imgurlProf = widget.userDetails!.profUrl;
        imgurlBack = widget.userDetails!.backUrl;
      }
      final user = UserDetails(
        fname: _firstNameController.text,
        lname: _lastNameController.text,
        phoneNum: _phoneNumberController.text,
        profUrl: imgurlProf,
        backUrl: imgurlBack,
        id: data,
      );
      await UpdateUser(user: user).updateUserFunc();
    } catch (e) {
      print(e);
    }
    setState(() {
      _isloading = false;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Updated Successfully!'),
      ),
    );
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
                      image: _backImage != null
                          ? DecorationImage(
                              image: MemoryImage(_backImage!),
                              fit: BoxFit.cover,
                            )
                          : DecorationImage(
                              image: NetworkImage(
                                  widget.userDetails!.backUrl!.isEmpty
                                      ? _coverPhoto
                                      : widget.userDetails!.backUrl!),
                              fit: BoxFit.cover,
                            ),
                      // DecorationImage(
                      //   image: AssetImage(_coverPhoto),
                      //   fit: BoxFit.cover,
                      // ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(Icons.arrow_back_ios_new),
                              color: Colors.white,
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CustomFooterNavigationBarNew(
                                              index: 3,
                                            )));
                              },
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
                            text: "Edit Profile",
                          ),
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        Visibility(
                          visible: true,
                          child: Positioned.fill(
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: GestureDetector(
                                onTap: () {
                                  selectImageBack();
                                },
                                child: Icon(Icons.camera_alt,
                                    size: 40, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: true,
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
                      padding: const EdgeInsets.only(
                        left: 50.0,
                        right: 50.0,
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: h * 0.13,
                          ),
                          Column(
                            children: [
                              editInputTitle(
                                  text: 'First Name', icon: Icons.person),
                              TextFormField(
                                controller: _firstNameController,
                                decoration: InputDecoration(
                                  hintText: 'Enter your first name',
                                  hintStyle: TextStyle(),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: [
                              editInputTitle(
                                  text: 'Last Name', icon: Icons.person),
                              TextFormField(
                                controller: _lastNameController,
                                decoration: InputDecoration(
                                  hintText: 'Enter your last name',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: [
                              editInputTitle(
                                  text: 'Phone Number', icon: Icons.call),
                              TextFormField(
                                controller: _phoneNumberController,
                                decoration: InputDecoration(
                                  hintText: 'Enter your phone number',
                                  hintStyle: TextStyle(),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          _isloading
                              ? CircularProgressIndicator()
                              : CustomSquareButton(
                                  onTap: () {
                                    saveData(widget.userDetails!.id);
                                  },
                                  buttonText: "Set Profile",
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
                          child: _profImage != null
                              ? CircleAvatar(
                                  radius: 70,
                                  backgroundImage: MemoryImage(_profImage!),
                                )
                              : CircleAvatar(
                                  radius: 70,
                                  backgroundImage: NetworkImage(
                                      widget.userDetails!.backUrl!.isEmpty
                                          ? _profileImage
                                          : widget.userDetails!.profUrl!),
                                )),
                      Visibility(
                        visible: true,
                        child: Positioned.fill(
                          child: MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {
                                selectImageProf();
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
                        visible: true,
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
                    'Name',
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
