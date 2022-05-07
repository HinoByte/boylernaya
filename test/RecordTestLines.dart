import 'package:boylernaya/DataMapper/RecordsSensorsMapper.dart';
import 'package:boylernaya/DataMapper/UnitsMapper.dart';
import 'package:boylernaya/DataMapper/UsersMapper.dart';
import 'package:boylernaya/TableModule/RecordsSensors.dart';
import 'package:boylernaya/TableModule/Units.dart';
import 'package:boylernaya/TableModule/Users.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common/sqlite_api.dart';

class RecordTestLines {
  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    sqfliteFfiInit();
    var databaseFactory = databaseFactoryFfi;
    var datab = await databaseFactory.openDatabase('/home/hino/boiler.db');

    await datab.execute(
      "CREATE TABLE users ("
      "idUser INTEGER PRIMARY KEY,"
      "firstName TEXT,"
      "lastName TEXT,"
      "loginName TEXT,"
      "password TEXT,"
      "isAdmin INT"
      ")",
    );

    await datab.execute(
      "CREATE TABLE actionsOperator ("
      "idAction INTEGER PRIMARY KEY,"
      "idUser INT,"
      "idUnit INT,"
      "status INT,"
      "dataTime TEXT"
      ")",
    );

    await datab.execute(
      "CREATE TABLE recordsSensors ("
      "idRecord INTEGER PRIMARY KEY,"
      "idUnit INT,"
      "isOpen INT,"
      "tempWater INT,"
      "levelWater INT,"
      "isCrash INT,"
      "dataTime TEXT"
      ")",
    );

    await datab.execute(
      "CREATE TABLE units ("
      "idUnit INTEGER PRIMARY KEY,"
      "nameUnit TEXT"
      ")",
    );
    return datab;
  }

  List<Units> addUnits = [
    Units(nameUnit: "Valve_1"),
    Units(nameUnit: "Valve_2"),
    Units(nameUnit: "Valve_3"),
    Units(nameUnit: "Valve_4"),
    Units(nameUnit: "Valve_5"),
    Units(nameUnit: "Valve_6"),
    Units(nameUnit: "Valve_7"),
    Units(nameUnit: "GasValve_1"),
    Units(nameUnit: "GasValve_2"),
    Units(nameUnit: "GasValve_3"),
    Units(nameUnit: "GasValve_4"),
    Units(nameUnit: "Burner_1"),
    Units(nameUnit: "Burner_2"),
    Units(nameUnit: "Boiler_1"),
    Units(nameUnit: "Boiler_2"),
  ];

  List<RecordsSensors> testRecordsInfo = [
    RecordsSensors(idUnit: 1, isOpen: 0),
    RecordsSensors(idUnit: 2, isOpen: 1),
    RecordsSensors(idUnit: 3, isOpen: 1),
    RecordsSensors(idUnit: 4, isOpen: 0),
    RecordsSensors(idUnit: 5, isOpen: 1),
    RecordsSensors(idUnit: 6, isOpen: 1),
    RecordsSensors(idUnit: 7, isOpen: 0),
    RecordsSensors(idUnit: 8, isOpen: 1),
    RecordsSensors(idUnit: 9, isOpen: 1),
    RecordsSensors(idUnit: 10, isOpen: 0),
    RecordsSensors(idUnit: 11, isOpen: 1),
    RecordsSensors(idUnit: 12, isOpen: 0),
    RecordsSensors(idUnit: 13, isOpen: 1),
    RecordsSensors(idUnit: 14, tempWater: 75, levelWater: 55),
    RecordsSensors(idUnit: 15, tempWater: 50, levelWater: 10),
  ];
  List<RecordsSensors> checkLastInfo = [
    RecordsSensors(idUnit: 1, isOpen: 1),
    RecordsSensors(idUnit: 1, isOpen: 0),
    RecordsSensors(idUnit: 1, isOpen: 1),
  ];

  Users testUser = Users(
      firstName: "testUser",
      lastName: "12345",
      loginName: 'user',
      password: '12345',
      isAdmin: 1);

  addTestInfo() async {
//    final Database dbClient = await database;

    await UserMapper().insert(testUser);

    addUnits.forEach(
      (element) {
        UnitsMapper().insert(element);
      },
    );

    testRecordsInfo.forEach(
      (element) {
        RecordsSensorsMapper().insert(element);
      },
    );

    var i = await RecordsSensorsMapper().getDeviceInfo(1);
    print(
        'Положение ${i.idUnit} элемента состояние ${i.isOpen} - запись ${i.idRecord}');
    checkLastInfo.forEach(
      (element) {
        RecordsSensorsMapper().insert(element);
      },
    );
    var g = await RecordsSensorsMapper().getDeviceInfo(1);
    print(
        'Положение ${g.idUnit} элемента состояние ${g.isOpen} - запись ${g.idRecord}');
  }
}
