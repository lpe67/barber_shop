import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatelessWidget {
  final titleStyle = const TextStyle(
      color: Colors.black, fontSize: 10, fontWeight: FontWeight.normal);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: Container(
          child: Column(children: [
        Container(
            constraints:
                const BoxConstraints(maxHeight: 200, minWidth: double.infinity),
            margin: const EdgeInsets.only(left: 0, right: 0, top: 0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              color: Colors.white,
            ),
            padding: const EdgeInsets.only(top: 30),
            child: Column(children: [
              Container(
                constraints: BoxConstraints(maxWidth: 150),
                margin: EdgeInsets.only(top: 10),
                child: icones(),
              ),
              Container(
                  constraints: const BoxConstraints(
                    maxHeight: 544,
                    maxWidth: 360,
                  ),
                  margin:
                      const EdgeInsets.only(left: 150, right: 150, bottom: 0),
                  child: Image.asset('assets/images/logo.png')),
            ])),
        Container(
          margin: EdgeInsets.only(left: 30, top: 30, right: 150),
          child: Text('Bem-vindo! [placeholder]',
              style: TextStyle(color: Colors.white, fontSize: 25)),
        ),
        Container(
            constraints:
                BoxConstraints(minWidth: double.infinity, minHeight: 200),
            margin: EdgeInsets.only(left: 20, right: 20, top: 30),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20,))),
                  ),
      ])),
    );
  }
  
  @override
  Widget icones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: Facebook, icon: Icon(Icons.facebook)),
        IconButton(onPressed: Twitter, icon: Icon(MdiIcons.twitter)),
        IconButton(onPressed: Instagram, icon: Icon(MdiIcons.instagram)),
      ],
    );
  }

  Facebook() {
    launch("https://facebook.com");
  }

  Instagram() {
    launch("https://instagram.com");
  }

  Twitter() {
    launch("https://twitter.com");
  }
}
