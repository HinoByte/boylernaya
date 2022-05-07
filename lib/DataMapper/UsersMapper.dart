import 'package:boylernaya/TableModule/Users.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common/sqlite_api.dart';

class UserMapper {
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

  insert(Users user) async {
    final Database dbClient = await database;
    await dbClient.insert(
      'users',
      user.toMap(),
    );
    //dbClient.close();
  }

  delete(Users user) async {
    final Database dbClient = await database;
    await dbClient.delete(
      'users',
      where: "idUser = ?",
      whereArgs: [user.idUser],
    );
  }

  Future<List<Users>> getAllUsers() async {
    final Database dbClient = await database;
    var res = await dbClient.query('users');
    List<Users> list =
        res.isNotEmpty ? res.map((c) => Users.fromMap(c)).toList() : null;
    return list;
  }
}
