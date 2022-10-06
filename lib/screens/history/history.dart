import 'package:barber_shop/screens/model/agenda.dart';
import 'package:barber_shop/screens/model/list_of_hour.dart';
import 'package:barber_shop/screens/repository/agenda_repository.dart';
import 'package:barber_shop/screens/agendaments/resource/item_list.dart';
import 'package:flutter/material.dart';

class History extends StatelessWidget {
  const History({super.key});

  final titleStyle = const TextStyle(
      color: Colors.black, fontSize: 10, fontWeight: FontWeight.normal);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.black,
        title: const Text("Meus clientes"),
      ),
      body: FutureBuilder(
        future: AgendaRepository.findAll(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.none ||
              snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.data != null && snapshot.hasData) {
            final agendas = snapshot.data! as List<Agenda>;
            return Container(
              margin: const EdgeInsets.all(16),
              child: ListView.separated(
                itemCount: agendas.length,
                itemBuilder: (_, index) {
                  return ItemList(
                    agenda: agendas[index],
                  );
                },
                separatorBuilder: (_, index) {
                  return const Divider();
                },
              ),
            );
          } else {
            return const Center(
              child: Text("Não existem clientes cadastrados"),
            );
          }
        },
      ),
    );
  }
}
