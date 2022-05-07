import 'package:boylernaya/TableModule/TableModule.dart';
import 'package:flutter/material.dart';

class ControlBoiler extends StatefulWidget {
  ControlBoiler({this.idUnit, this.isOpen = true});
  final int idUnit;
  final bool isOpen;

  @override
  _ControlBoilerState createState() => _ControlBoilerState();
}

class _ControlBoilerState extends State<ControlBoiler> {
  bool isOpen;
  String _backgroundImage;
  String _status;
  get idUnit => widget.idUnit;

  String _setText() {
    if (idUnit < 8) {
      return 'Вентиль № $idUnit';
    } else if (idUnit < 12) {
      return 'Газовый Вентиль № ${idUnit - 7}';
    } else
      return 'Горелка № ${idUnit - 11}';
  }

  String _setImage() {
    if (isOpen == true) {
      if (idUnit < 12) {
        _backgroundImage = "assets/images/green_rectangle.png";
        _status = 'Открыт';
      } else {
        _backgroundImage = "assets/images/fire.jpg";
        _status = 'ВКЛ';
      }
    }
    if (isOpen == false) {
      if (idUnit < 12) {
        _backgroundImage = "assets/images/red_rectangle.png";
        _status = 'Закрыт';
      } else {
        _backgroundImage = "assets/images/noFire.png";
        _status = 'ВЫКЛ';
      }
    }
    return _backgroundImage;
  }

  @override
  void initState() {
    super.initState();
    isOpen = widget.isOpen;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 20),
            child: Column(
              children: [
                Container(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      _setText(),
                      style: TextStyle(fontSize: 20),
                    )),
                Row(
                  children: [
                    SizedBox(
                      width: 35,
                      height: 35,
                      child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            setState(() {
                              isOpen = !isOpen;
                              TableModule().recerseValveElement(idUnit);
                              TableModule().saveActionInSystem(idUnit, isOpen);
                            });
                          },
                          child: Image(image: AssetImage(_setImage()))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(_status),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
