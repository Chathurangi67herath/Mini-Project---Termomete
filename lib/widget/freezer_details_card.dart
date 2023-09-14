import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:termomete/screens/freezerdetails.dart';

import 'package:termomete/widget/Temparature_condition.dart';

class FreezerDetailsCard extends StatefulWidget {
  FreezerDetailsCard({
    super.key,
    required this.w,
    required this.h,
  });

  final double w;
  final double h;

  @override
  State<FreezerDetailsCard> createState() => _FreezerDetailsCardState();
}

class _FreezerDetailsCardState extends State<FreezerDetailsCard> {
  DatabaseReference getdata = FirebaseDatabase.instance.ref('DHT');
  final condition_h = TempCondition.temCondition['high'];

  final condition_n = TempCondition.temCondition['normal'];

  final condition_l = TempCondition.temCondition['low'];
  var condition;

  @override
  Widget build(BuildContext context) {
    Map data = {'temperature': 0, 'humidity': 0};

    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FreezerDetails()),
          );
        },
        child: StreamBuilder(
            stream: getdata.onValue,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasData) {
                data = snapshot.data!.snapshot.value as Map;
                if (data['temperature'] < data['lrange']) {
                  condition = condition_l;
                } else if (data['temperature'] > data['lrange'] &&
                    data['temperature'] < data['hrange']) {
                  condition = condition_n;
                } else {
                  condition = condition_h;
                }
              }
              return Container(
                width: widget.w,
                child: Column(
                  children: [
                    Container(
                      width: widget.w * 0.9,
                      height: widget.h * 0.15,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(217, 217, 217, 0.68),
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(217, 217, 217, 0.68)
                                .withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'img/fdetails.jpg',
                            width: 150,
                            height: 70,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Vertical Deep Freezer 500L',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(
                                height: widget.h * 0.01,
                              ),
                              Text(
                                'Uplight Freezer',
                                style: TextStyle(
                                  color: Color.fromRGBO(11, 55, 120, 1),
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(
                                height: widget.h * 0.01,
                              ),
                              Row(
                                children: [
                                  Text('${data['temperature'] ?? 0} C\u00B0'),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    child: Text(
                                      condition['condition'] ?? 0,
                                      style: TextStyle(
                                        color: condition['color'],
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    condition['icon'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
