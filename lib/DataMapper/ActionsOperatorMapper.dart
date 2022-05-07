import 'package:boylernaya/TableModule/ActionsOperator.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common/sqlite_api.dart';

class ActionsOperatorMapper {
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

  insert(ActionsOperator action) async {
    final Database dbClient = await database;
    await dbClient.insert(
      'actionsOperator',
      action.toMap(),
    );
    //dbClient.close();
  }

  delete(ActionsOperator action) async {
    final Database dbClient = await database;
    await dbClient.delete(
      'actionsOperator',
      where: "idAction = ?",
      whereArgs: [action.idAction],
    );
  }

  Future<List<ActionsOperator>> getAllActions() async {
    final Database dbClient = await database;
    var res = await dbClient.query('actionsOperator');
    List<ActionsOperator> list = res.isNotEmpty
        ? res.map((c) => ActionsOperator.fromMap(c)).toList()
        : null;
    return list;
  }
}
