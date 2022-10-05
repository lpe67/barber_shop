import 'package:sqflite/sqflite.dart';

class DAO {
  static Future<Database> getConnection() async {
    const dbName = 'barberdb.db';
    final dbPath = getDatabasesPath();
    final path = '$dbPath $dbName';

    final db = await openDatabase(path, version: 1, onCreate: (db, _) async {
      const sql =
          'CREATE TABLE barber_shop(id	INTEGER PRIMARY KEY AUTOINCREMENT, name_agenda	TEXT NOT NULL,telefone_agenda	INTEGER NOT NULL,email_agenda	TEXT NOT NULL,data_agenda	TEXT NOT NULL);';
      await db.execute(sql);
    });
    return db;
  }
}
