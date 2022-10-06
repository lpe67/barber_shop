import 'package:barber_shop/screens/edit/edit.dart';
import 'package:barber_shop/screens/model/agenda.dart';
import 'package:barber_shop/screens/model/agenda.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  Agenda agenda;
  Details({
    super.key,
    required this.agenda,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          agenda.name_agenda,
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(
                16,
              ),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      agenda.name_agenda,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.call),
                            const SizedBox(
                              width: 16,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(agenda.telefone_agenda),
                                const Text("Telefone"),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        EditAgenda(agenda: agenda),
                                  ),
                                );
                              },
                              child: Text(
                                'Editar cliente',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )),
                        )
                      ],
                    ),
                    const Divider(),
                    Row(
                      children: [
                        const Icon(Icons.email_outlined),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(agenda.name_agenda),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column action({
    required IconData icon,
    required String text,
  }) {
    return Column(
      children: [
        Icon(icon),
        Text(text),
      ],
    );
  }
}
