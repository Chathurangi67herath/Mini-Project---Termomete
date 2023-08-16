import 'package:flutter/material.dart';

class AddFreezerPage extends StatefulWidget {
  const AddFreezerPage({Key? key}) : super(key: key);

  @override
  State<AddFreezerPage> createState() => _AddFreezerPageState();
}

class _AddFreezerPageState extends State<AddFreezerPage> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 246, 254, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(11, 55, 120, 1),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          padding: EdgeInsets.only(
            left: 20.0,
          ),
        ),
        centerTitle: true,
        title: Text(
          "Add New Freezer",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Lemon-Regular',
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                Text("Freezer Name"),
                TextField(
                  decoration: InputDecoration(),
                ),
              ],
            ),
            //child: Text("Freezer Name"),
          ),
          Container(),
          Container(),
          SizedBox(
            height: h * 0.03,
          ),
          Container(
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('');
                },
                child: Container(
                  width: w * 0.9,
                  height: h * 0.07,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(11, 55, 120, 1),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(217, 217, 217, 0.68)
                            .withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      "Add New Freezer",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
