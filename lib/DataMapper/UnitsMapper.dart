import 'package:boylernaya/TableModule/Units.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common/sqlite_api.dart';

class UnitsMapper {
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

  insert(Units unit) async {
    final Database dbClient = await database;
    await dbClient.insert(
      'units',
      unit.toMap(),
    );
    //dbClient.close();
  }

  delete(Units unit) async {
    final Database dbClient = await database;
    await dbClient.delete(
      'units',
      where: "idUnit = ?",
      whereArgs: [unit.idUnit],
    );
  }

  Future<List<Units>> getAllUnits() async {
    final Database dbClient = await database;
    var res = await dbClient.query('units');
    List<Units> list =
        res.isNotEmpty ? res.map((c) => Units.fromMap(c)).toList() : null;
    return list;
  }
}
