import 'package:barber_shop/screens/model/agenda.dart';
import 'package:barber_shop/screens/details/details.dart';
import 'package:flutter/material.dart';

class ItemList extends StatelessWidget {
  Agenda agenda;
  ItemList({
    super.key,
    required this.agenda,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              child: Text(
                agenda.name_agenda.substring(0, 1),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(agenda.name_agenda),
                Text(agenda.data_agenda),
              ],
            ),
          ],
        ),
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => Details(
                  agenda: agenda,
                ),
              ),
            );
          },
          icon: const Icon(
            Icons.chevron_right,
          ),
        ),
      ],
    );
  }
}
