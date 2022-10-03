import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class About extends StatelessWidget {
  final titleStyle = const TextStyle(
      color: Colors.black, fontSize: 10, fontWeight: FontWeight.normal);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        margin: EdgeInsets.only(left: 22, right: 22, top: 40, bottom: 80),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(MdiIcons.arrowLeft)),
                Text('Informações', style: TextStyle(fontSize: 20),),
              ],
            ),
            Container(
            child: Text('VERSÃO DO SOFTWARE: 20.22.1', style: TextStyle(fontFamily: 'Inter', fontSize: 20, fontWeight: FontWeight.w700),),
            margin: EdgeInsets.only(top: 20,),
            ),
            Container(
            child: Text('VERSÃO DO MODELO: AeosKE7sxt39q2', style: TextStyle(fontFamily: 'Inter', fontSize: 20, fontWeight: FontWeight.w700),),
            margin: EdgeInsets.only(top: 20,),
            ),
            Container(
            child: Text('Participantes\n *João Cassol \n *João Gabriel\n *Filipe', style: TextStyle(fontFamily: 'Inter', fontSize: 20, fontWeight: FontWeight.w700),),
            margin: EdgeInsets.only(top: 20, right: 200),
            ),
          ],
        ),
      ),
    );
  }
}
