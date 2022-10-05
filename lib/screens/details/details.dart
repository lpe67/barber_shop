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
                        Row(
                          children: const [
                            Icon(Icons.videocam),
                            Icon(Icons.message_outlined)
                          ],
                        ),
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
