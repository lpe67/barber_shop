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
}
