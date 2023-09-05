import 'package:flutter/material.dart';
import 'package:termomete/freezerdetails.dart';

class FreezerDetailsCard extends StatelessWidget {
  const FreezerDetailsCard({
    super.key,
    required this.w,
    required this.h,
  });

  final double w;
  final double h;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FreezerDetails()),
          );
        },
        child: Container(
          width: w,
          child: Column(
            children: [
              Container(
                width: w * 0.9,
                height: h * 0.15,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(217, 217, 217, 0.68),
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color:
                          Color.fromRGBO(217, 217, 217, 0.68).withOpacity(0.5),
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
                          height: h * 0.01,
                        ),
                        Text(
                          'Uplight Freezer',
                          style: TextStyle(
                            color: Color.fromRGBO(11, 55, 120, 1),
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(
                          height: h * 0.01,
                        ),
                        Row(
                          children: [
                            Text('Temp: 5oF'),
                            Padding(
                              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Text(
                                'High',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Text(
                              ' 😑',
                              style: TextStyle(
                                color: Colors.red,
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
        ),
      ),
    );
  }
}
