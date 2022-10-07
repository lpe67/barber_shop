import 'package:barber_shop/screens/model/agenda.dart';
import 'package:barber_shop/screens/model/dao.dart';

class AgendaRepository {
  static const _table = "barber_shop";
  static Future<int> insertContact(Agenda agenda) async {
    final db = await DAO.getConnection();
    return await db.insert(_table, agenda.toMap());
  }

  static Future<List<Agenda>> findAll() async {
    final db = await DAO.getConnection();
    final elements = await db.query(_table);
    return elements.map((element) => Agenda.fromMap(element)).toList();
  }

  static Future<List<Agenda>> Agending() async {
    final db = await DAO.getConnection();
    final elements = await db.query(
        "SELECT * FROM barber_shop WHERE strftime('%Y-%m-%d', 'now') < strftime('%Y-%m-%d', data_agenda);");
    return elements.map((element) => Agenda.fromMap(element)).toList();
  }

  static Future<int> updateAgenda(Agenda agenda) async {
    final db = await DAO.getConnection();
    return await db.update(
      _table,
      agenda.toMap(),
      where: "id=?",
      whereArgs: [agenda.id],
    );
  }

  static Future<int> deleteAgenda(Agenda agenda) async {
    final db = await DAO.getConnection();
    return await db.delete(_table, where: "id=?", whereArgs: [agenda.id]);
  }
}
