import 'package:sqflite/sqflite.dart';

class DAO {
  static Future<Database> getConnection() async {
    const dbName = 'barberdb.db';
    final dbPath = getDatabasesPath();
    final path = '$dbPath $dbName';

    final db = await openDatabase(path, version: 1, onCreate: (db, _) async {
      const sql =
          'CREATE TABLE Agendamento(id_agenda	INTEGER, id_conta	INTEGER NOT NULL,name_agenda	TEXT NOT NULL,telefone_agenda	INTEGER NOT NULL,email_agenda	TEXT NOT NULL,data_agenda	INTEGER NOT NULL,PRIMARY KEY(id_agenda AUTOINCREMENT),FOREIGN KEY(id_conta) REFERENCES Conta(id_conta)';
      await db.execute(sql);
    });
    return db;
  }
}
