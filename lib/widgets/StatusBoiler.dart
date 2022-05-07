import 'package:boylernaya/TableModule/RecordsSensors.dart';
import 'package:flutter/material.dart';
import 'package:boylernaya/TableModule/TableModule.dart';

class StatusBoiler extends StatefulWidget {
  StatusBoiler({Key key, @required this.idSensor}) : super(key: key);

  final int idSensor;

  @override
  _StatusBoilerState createState() => _StatusBoilerState();
}

class _StatusBoilerState extends State<StatusBoiler> {
  String _backgroundImage = "assets/images/green.png";
  int _tempWater = 0;
  int _levelWater = 0;
  bool _failure = false;

  @override
  void initState() {
    super.initState();
    _giveInfo();
  }

  Future<void> _giveInfo() async {
    RecordsSensors info =
        await TableModule().getCurrentInformation(widget.idSensor);
    setState(() {
      _tempWater = info.tempWater;
      _levelWater = info.levelWater;
      _setStatus();
    });
  }

  _setStatus() {
    if (_tempWater > 80)
      _failure = true;
    else if (_levelWater < 500)
      _failure = true;
    else
      _failure = false;
  }

  _setImage() {
    if (_failure == false) {
      _backgroundImage = "assets/images/green.png";
    } else {
      _backgroundImage = "assets/images/red.png";
    }
    return _backgroundImage;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              'Температура = $_tempWater С',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            'Уровень воды = $_levelWater мм',
            style: TextStyle(
              color: Colors.grey[500],
            ),
          ),
          Container(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                children: [
                  Text('Авария'),
                  SizedBox(
                    width: 25,
                  ),
                  SizedBox(
                    width: 35,
                    height: 35,
                    child: Image(image: AssetImage(_setImage())),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
