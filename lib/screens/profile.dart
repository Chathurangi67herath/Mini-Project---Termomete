import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:termomete/model/user.dart';
import 'package:termomete/screens/newEditPage.dart';
import 'package:termomete/services/get_userDetails.dart';

import '/widget/Custom_button.dart';
import '/widget/Custom_text.dart';

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
  String _empId = "";

  String _profileImage = 'img/profile.png';
  String _coverPhoto = 'img/profilecover.jpg';

  // Text editing controllers for editing mode
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();

  // Editing mode flag
  late Future<UserDetails> futuredata;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  var currentUser;
  bool _isLoading = false;
  bool _isEdit = false;
  @override
  void initState() {
    currentUser = _auth.currentUser!.uid;
    futuredata = GetUserDetails(currentUser: currentUser).getDetails();
    super.initState();

    // print(currentUser);
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneNumberController.dispose();

    super.dispose();
  }

  void _saveChanges() {
    setState(() {
      _firstName = _firstNameController.text;
      _lastName = _lastNameController.text;
      _phoneNumber = _phoneNumberController.text;
    });
  }

  String getFullName() {
    return "$_firstName $_lastName";
  }

  // bool _noData = false;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        child: FutureBuilder(
            future: futuredata,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print('ttt');
                final data = snapshot.data as UserDetails;

                return SingleChildScrollView(
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
                              image: data.backUrl!.isEmpty
                                  ? DecorationImage(
                                      image: AssetImage(_coverPhoto),
                                      fit: BoxFit.cover,
                                    )
                                  : DecorationImage(
                                      image: NetworkImage(data.backUrl!),
                                      fit: BoxFit.cover,
                                    ),
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 25,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    backButton(
                                      path: '/bnavigation',
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.settings),
                                      color: Colors.white,
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pushNamed('/setting');
                                      },
                                    ),
                                  ],
                                ),
                                Positioned(
                                  child: CustomText(
                                    text: "Profile",
                                  ),
                                ),
                                SizedBox(
                                  height: 25.0,
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
                                  left: 50.0, right: 50.0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: h * 0.16,
                                  ),
                                  Column(
                                    children: [
                                      editInputTitle(
                                          text: 'First Name',
                                          icon: Icons.person),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 30,
                                          ),
                                          Text(data.fname!),
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
                                          text: 'Last Name',
                                          icon: Icons.person),
                                      Row(
                                        children: [
                                          SizedBox(width: 30),
                                          Text(data.lname!),
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
                                          text: 'Phone Number',
                                          icon: Icons.call),
                                      Row(
                                        children: [
                                          SizedBox(width: 30),
                                          Text(data.phoneNum!),
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
                                  SizedBox(
                                    height: 10,
                                  ),
                                  CustomSquareButton(
                                    onTap: () async {
                                      await Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  NewProfilePage(
                                                    userDetails: data,
                                                  )));
                                      // _toggleEditing();
                                      setState(() {});
                                    },
                                    buttonText: "Edit Profile",
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
                                child: data.profUrl!.isEmpty
                                    ? CircleAvatar(
                                        radius: 70,
                                        backgroundImage:
                                            AssetImage(_profileImage),
                                      )
                                    : CircleAvatar(
                                        radius: 70,
                                        backgroundImage:
                                            NetworkImage(data.profUrl!),
                                      ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: h * 0.43 - 5 - 70 / 1,
                          left: w - 200,
                          child: data.fname == null
                              ? Text(
                                  'Name',
                                  style: TextStyle(
                                    fontFamily: 'Poppins-Bold',
                                    color: Color.fromRGBO(11, 55, 120, 1),
                                    fontSize: 20.0,
                                  ),
                                )
                              : Text(
                                  data.fname! + " " + data.lname!,
                                  style: TextStyle(
                                    fontFamily: 'Poppins-Bold',
                                    color: Color.fromRGBO(11, 55, 120, 1),
                                    fontSize: 20.0,
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Text("err");
              }

              return Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
