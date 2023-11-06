import 'package:sqflite/sqflite.dart';

class DatabaseService {
  Database? database;
  open() async {
    database = await openDatabase(
      'notes.db',
      version: 1,
      onCreate: (db, version) {
        db.execute(
            "CREATE TABLE notes (id INTEGER PRIMARY KEY, title TEXT, date TEXT, description TEXT)");
      },
    );
  }


  insert(String name, Map<String, Object> values){
    database?.insert(name, values);
  }
}
