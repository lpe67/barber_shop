import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Pricetable extends StatelessWidget {
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
                    Text('Tabela de Valores', style: TextStyle(fontSize: 20),),
              ],
            ),
Container(
            child: Text('Completo | Barba + Cabelo + Sobrancelha', style: TextStyle(fontFamily: 'Inter', fontSize: 20, fontWeight: FontWeight.w700),),
            margin: EdgeInsets.only(top: 20, right: 30),
            ),
Container(
            child: Text('R\$45,00', style: TextStyle(fontFamily: 'Inter', fontSize: 45, fontWeight: FontWeight.w700),),
            margin: EdgeInsets.only(top: 10, right: 190),
            ),
            Container(
            child: Text('Máquina + Tesoura', style: TextStyle(fontFamily: 'Inter', fontSize: 20, fontWeight: FontWeight.w700),),
            margin: EdgeInsets.only(top: 20, right: 190),
            ),
Container(
            child: Text('R\$35,00', style: TextStyle(fontFamily: 'Inter', fontSize: 45, fontWeight: FontWeight.w700),),
            margin: EdgeInsets.only(top: 10, right: 190),
            ),
            Container(
            child: Text('Tesoura', style: TextStyle(fontFamily: 'Inter', fontSize: 20, fontWeight: FontWeight.w700),),
            margin: EdgeInsets.only(top: 20, right: 270),
            ),
Container(
            child: Text('R\$30,00', style: TextStyle(fontFamily: 'Inter', fontSize: 45, fontWeight: FontWeight.w700),),
            margin: EdgeInsets.only(top: 10, right: 190),
            ),
            Container(
            child: Text('Máquina', style: TextStyle(fontFamily: 'Inter', fontSize: 20, fontWeight: FontWeight.w700),),
            margin: EdgeInsets.only(top: 20, right: 270),
            ),
Container(
            child: Text('R\$20,00', style: TextStyle(fontFamily: 'Inter', fontSize: 45, fontWeight: FontWeight.w700),),
            margin: EdgeInsets.only(top: 10, right: 190),
            ),
          ],
        ),
      ),
    );
  }
}
