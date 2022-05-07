import 'package:boylernaya/screens/schema_screen.dart';
import 'package:boylernaya/widgets/StatusBoiler.dart';
import 'package:boylernaya/widgets/ConrolBoiler.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Padding(
                padding: const EdgeInsets.only(top: 8.0), child: reports),
          ),
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SchemaScreen()),
                  );
                },
                color: Colors.deepOrange,
                textColor: Colors.white,
                child: const Text('Схема'),
              )),
          Padding(
            padding: const EdgeInsets.only(left: 45.0, top: 15.0),
            child: Row(
              children: [
                Text(
                  'Бойлерная №1',
                  style: TextStyle(fontSize: 35),
                ),
                SizedBox(
                  width: 16.0,
                ),
                StatusBoiler(
                  idSensor: 14,
                ),
                /*3*/ SizedBox(
                  width: 100.0,
                ),
                Text(
                  'Бойлерная №2',
                  style: TextStyle(fontSize: 35),
                ),
                SizedBox(
                  width: 16.0,
                ),
                StatusBoiler(
                  idSensor: 15,
                )
              ],
            ),
          ),
          drowValve,
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 38.0),
            child: drowGasValve,
          ),
          Padding(
              padding: const EdgeInsets.only(left: 370.0), child: drowBurner),
          drowSensorsInfo
        ],
      ),
    );
  }
}

Widget reports = Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    ElevatedButton(
      onPressed: () {},
      child: Text('Отчет о действиях оператора'),
    ),
    SizedBox(
      width: 10.0,
    ),
    ElevatedButton(
      onPressed: () {},
      child: Text('Отчет о расходе воды и газа'),
    ),
  ],
);

Widget drowValve = Row(
  children: [
    Row(
      children: [
        ControlBoiler(idUnit: 1),
        ControlBoiler(idUnit: 2, isOpen: false),
        ControlBoiler(idUnit: 3),
        ControlBoiler(idUnit: 4, isOpen: false),
        ControlBoiler(idUnit: 5, isOpen: false),
        ControlBoiler(idUnit: 6),
        ControlBoiler(idUnit: 7),
      ],
    )
  ],
);

Widget drowGasValve = Row(
  children: [
    Row(
      children: [
        ControlBoiler(idUnit: 8),
        ControlBoiler(idUnit: 9),
        ControlBoiler(idUnit: 10),
        ControlBoiler(idUnit: 11),
      ],
    )
  ],
);

Widget drowBurner = Row(
  children: [
    Row(
      children: [ControlBoiler(idUnit: 12), ControlBoiler(idUnit: 13)],
    )
  ],
);

Widget drowSensorsInfo = Padding(
  padding: const EdgeInsets.only(left: 320),
  child: Row(
    children: [
      Column(
        children: [
          Text(
            'Датчик расхода воды',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Container(
              child: Text(
                '555,1 м^3',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
        ],
      ),
      SizedBox(
        width: 25,
      ),
      Column(
        children: [
          Text(
            'Датчик расхода газа',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Container(
              child: Text(
                '774 м^3',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    ],
  ),
);
