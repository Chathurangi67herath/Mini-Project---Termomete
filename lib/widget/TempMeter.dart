import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:termomete/widget/HomeCard.dart';
import 'package:termomete/widget/Temparature_condition.dart';
import 'package:termomete/screens/freezerdetails.dart';

class TempMeter extends StatefulWidget {
  const TempMeter({super.key});

  @override
  State<TempMeter> createState() => _TempMeterState();
}

class _TempMeterState extends State<TempMeter> {
  DatabaseReference getdata = FirebaseDatabase.instance.ref('DHT');
  int st = 0;
  int ed = 0;
  double currentTemp = 20;
  final condition_h = TempCondition.temCondition['high'];

  final condition_n = TempCondition.temCondition['normal'];

  final condition_l = TempCondition.temCondition['low'];
  var condition;
  @override
  Widget build(BuildContext context) {
    Map data = {'temperature': 0, 'humidity': 0, 'name': "Freezer"};
    return StreamBuilder(
        stream: getdata.onValue,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasData) {
            data = snapshot.data!.snapshot.value as Map;

            ed = data['hrange'];
            st = data['lrange'];
            if (data['temperature'] < data['lrange']) {
              condition = condition_l;
              print(condition['colorPrimary']);
            } else if (data['temperature'] > data['lrange'] &&
                data['temperature'] < data['hrange']) {
              condition = condition_n;
              print(condition['colorPrimary']);
            } else {
              condition = condition_h;
              print(condition['colorPrimary']);
            }
          }
          return Card(
            child: Column(
              children: [
                Text(
                  data['name'],
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                //   child: ClipRect(
                //     child: Align(
                //       alignment: Alignment.center,
                //       heightFactor: 0.7,
                //       child: SfRadialGauge(
                //         axes: <RadialAxis>[
                //           RadialAxis(
                //             ticksPosition: ElementsPosition.outside,
                //             labelsPosition: ElementsPosition.outside,
                //             minorTicksPerInterval: 5,
                //             axisLineStyle: AxisLineStyle(
                //               thicknessUnit: GaugeSizeUnit.factor,
                //               thickness: 0.1,
                //             ),
                //             axisLabelStyle: GaugeTextStyle(
                //                 fontWeight: FontWeight.bold, fontSize: 16),
                //             radiusFactor: 0.70,
                //             majorTickStyle: MajorTickStyle(
                //                 length: 0.1,
                //                 thickness: 2,
                //                 lengthUnit: GaugeSizeUnit.factor),
                //             minorTickStyle: MinorTickStyle(
                //                 length: 0.05,
                //                 thickness: 1.5,
                //                 lengthUnit: GaugeSizeUnit.factor),
                //             minimum: -60,
                //             maximum: 120,
                //             interval: 20,
                //             startAngle: 115,
                //             endAngle: 65,
                //             ranges: <GaugeRange>[
                //               GaugeRange(
                //                   startValue: -60,
                //                   endValue: 120,
                //                   startWidth: 0.1,
                //                   sizeUnit: GaugeSizeUnit.factor,
                //                   endWidth: 0.1,
                //                   gradient: SweepGradient(stops: <double>[
                //                     0.2,
                //                     0.5,
                //                     0.75
                //                   ], colors: <Color>[
                //                     Colors.green,
                //                     Colors.yellow,
                //                     Colors.red
                //                   ]))
                //             ],
                //             pointers: <GaugePointer>[
                //               NeedlePointer(
                //                   value: 20,
                //                   needleColor: Colors.black,
                //                   tailStyle: TailStyle(
                //                       length: 0.18,
                //                       width: 8,
                //                       color: Colors.black,
                //                       lengthUnit: GaugeSizeUnit.factor),
                //                   needleLength: 0.68,
                //                   needleStartWidth: 1,
                //                   needleEndWidth: 8,
                //                   knobStyle: KnobStyle(
                //                       knobRadius: 0.07,
                //                       color: Colors.white,
                //                       borderWidth: 0.05,
                //                       borderColor: Colors.black),
                //                   lengthUnit: GaugeSizeUnit.factor)
                //             ],
                //             annotations: <GaugeAnnotation>[
                //               GaugeAnnotation(
                //                   widget: Text(
                //                     '°F',
                //                     style: TextStyle(
                //                         fontSize: 20,
                //                         fontWeight: FontWeight.w600),
                //                   ),
                //                   positionFactor: 0.8,
                //                   angle: 90)
                //             ],
                //           )
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                Row(
                  children: [
                    Expanded(
                      child: HomeCard(
                          title: "Expected Range",
                          upperTitle:
                              st.toString() + "~" + ed.toString() + "°C"),
                    ),
                    Expanded(
                      child: HomeCard(
                        title: "Current Temprature",
                        upperTitle: data['temperature'].toString() + "°C",
                        primaryColor: condition['colorPrimary'],
                        secondaryColor: condition['colorSecondery'],
                      ),
                    ),
                  ],
                ),
                HomeCard(
                    heigt: 140,
                    title: 'Current Status',
                    upperTitle: condition['currentStatus']),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          );
        });
  }
}
// axes: <RadialAxis>[
//         RadialAxis(
//           ticksPosition: ElementsPosition.outside,
//           labelsPosition: ElementsPosition.outside,
//           minorTicksPerInterval: 5,
//           axisLineStyle: AxisLineStyle(
//             thicknessUnit: GaugeSizeUnit.factor,
//             thickness: 0.1,
//           ),
//           axisLabelStyle:
//               GaugeTextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//           radiusFactor: 0.97,
//           majorTickStyle: MajorTickStyle(
//               length: 0.1, thickness: 2, lengthUnit: GaugeSizeUnit.factor),
//           minorTickStyle: MinorTickStyle(
//               length: 0.05, thickness: 1.5, lengthUnit: GaugeSizeUnit.factor),
//           minimum: -60,
//           maximum: 120,
//           interval: 20,
//           startAngle: 115,
//           endAngle: 65,
//         ),
//       ]

// ranges: <GaugeRange>[
//               GaugeRange(
//                   startValue: -60,
//                   endValue: 120,
//                   startWidth: 0.1,
//                   sizeUnit: GaugeSizeUnit.factor,
//                   endWidth: 0.1,
//                   gradient: SweepGradient(
//                       stops: <double>[0.2, 0.5, 0.75],
//                       colors: <Color>[Colors.green, Colors.yellow, Colors.red]))
//             ]

// pointers: <GaugePointer>[
//               NeedlePointer(
//                   value: 60,
//                   needleColor: Colors.black,
//                   tailStyle: TailStyle(
//                       length: 0.18,
//                       width: 8,
//                       color: Colors.black,
//                       lengthUnit: GaugeSizeUnit.factor),
//                   needleLength: 0.68,
//                   needleStartWidth: 1,
//                   needleEndWidth: 8,
//                   knobStyle: KnobStyle(
//                       knobRadius: 0.07,
//                       color: Colors.white,
//                       borderWidth: 0.05,
//                       borderColor: Colors.black),
//                   lengthUnit: GaugeSizeUnit.factor)
//             ],

// annotations: <GaugeAnnotation>[
//                 GaugeAnnotation(
//                     widget: Text(
//                       '°F',
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
//                     ),
//                     positionFactor: 0.8,
//                     angle: 90)
//               ],