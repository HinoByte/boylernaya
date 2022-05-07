import 'package:boylernaya/TableModule/RecordsSensors.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common/sqlite_api.dart';

class RecordsSensorsMapper {
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
    return datab;
  }

  insert(RecordsSensors record) async {
    final Database dbClient = await database;
    await dbClient.insert(
      'recordsSensors',
      record.toMap(),
    );
  }

  delete(RecordsSensors record) async {
    final Database dbClient = await database;
    await dbClient.delete(
      'recordsSensors',
      where: "idRecord = ?",
      whereArgs: [record.idRecord],
    );
  }

  Future<RecordsSensors> getDeviceInfo(int idUnit) async {
    final Database dbClient = await database;
    var res = await dbClient.rawQuery(
        "SELECT * FROM recordsSensors WHERE idUnit = $idUnit ORDER BY idRecord DESC LIMIT 1");
    List<RecordsSensors> list = res.isNotEmpty
        ? res.map((c) => RecordsSensors.fromMap(c)).toList()
        : null;
    return list[0];
  }

  Future<List<RecordsSensors>> getAllRecords() async {
    final Database dbClient = await database;
    var res = await dbClient.query('recordsSensors');
    List<RecordsSensors> list = res.isNotEmpty
        ? res.map((c) => RecordsSensors.fromMap(c)).toList()
        : null;
    return list;
  }
}
