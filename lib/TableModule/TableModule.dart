import 'package:boylernaya/DataMapper/ActionsOperatorMapper.dart';
import 'package:boylernaya/DataMapper/RecordsSensorsMapper.dart';
import 'package:boylernaya/DataMapper/UsersMapper.dart';
import 'package:boylernaya/TableModule/ActionsOperator.dart';
import 'package:boylernaya/TableModule/RecordsSensors.dart';
import 'package:boylernaya/TableModule/Users.dart';

class TableModule {
  int activeUser = 1;

  recerseValveElement(idUnit) async {
    //команда к оборудованию
  }

  checkPassword(context, loginName, password) async {
    List<Users> listUsers = await UserMapper().getAllUsers();
    return listUsers.every(
        (user) => (user.loginName == loginName) && (user.password == password));
  }

  Future<RecordsSensors> getCurrentInformation(int device) async =>
      await RecordsSensorsMapper().getDeviceInfo(device);

  int boolToInt(bool a) => a ? 1 : 0;

  Future saveActionInSystem(int idUnit, bool isOpen) async {
    var now = new DateTime.now();
    await ActionsOperatorMapper().insert(ActionsOperator(
        idUnit: idUnit,
        idUser: activeUser,
        status: boolToInt(isOpen),
        dataTime: now.toIso8601String()));
  }
}
