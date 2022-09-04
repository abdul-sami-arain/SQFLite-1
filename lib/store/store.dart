import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path/path.dart';

class DatabaseHelper {
  static final _databaseName = 'persons.db';
  static final _databaseVersion = 1;
  static final table = 'myTable';
  static final columnId = 'id';
  static final columnName = 'name';
  static final columnPhone = 'phone';
  static final columnEmail = 'email';

  static late Database _database;

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
         CREATE TABLE $table(
           $columnId INTEGER PRIMARY KEY,
           $columnName TEXT NOT NULL,
           $columnEmail TEXT NOT NULL,
           $columnPhone INTEGER NOT NULL,
         )
      ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }
}
