import 'dart:io';

import 'package:barber_shop/screens/agendaments/agendaments.dart';
import 'package:barber_shop/screens/config/config.dart';
import 'package:barber_shop/screens/history/history.dart';
import 'package:barber_shop/screens/neew/neew.dart';
import 'package:barber_shop/screens/pricetable/pricetable.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_grid_button/flutter_grid_button.dart';

import '../about/about.dart';

class Home extends StatelessWidget {
  final titleStyle = const TextStyle(
      color: Colors.black, fontSize: 10, fontWeight: FontWeight.normal);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black,
        body: Container(
          child: Column(
            children: [
              Container(
                  constraints: const BoxConstraints(
                      maxHeight: 200, minWidth: double.infinity),
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
                      constraints: const BoxConstraints(maxWidth: 150),
                      margin: const EdgeInsets.only(top: 10),
                      child: icones(),
                    ),
                    Container(
                        constraints: const BoxConstraints(
                          maxHeight: 544,
                          maxWidth: 360,
                        ),
                        margin: const EdgeInsets.only(
                            left: 150, right: 150, bottom: 0),
                        child: Image.asset('assets/images/logo.png')),
                  ])),
              Container(
                margin: const EdgeInsets.only(left: 30, top: 30, right: 280),
                child: const Text('Bem-vindo!',
                    style: TextStyle(color: Colors.white, fontSize: 25)),
              ),
              Container(
                constraints: const BoxConstraints(
                    minWidth: double.infinity, minHeight: 200),
                margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(
                      20,
                    ))),
                child: Container(
                    margin: const EdgeInsets.only(
                        bottom: 10, left: 10, right: 10, top: 7),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset('assets/images/banner1.png'),
                            const Text('AGENDE SEU\n   HOR??RIO',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30)),
                            Image.asset('assets/images/banner2.png')
                          ],
                        ),
                        const Icon(
                          MdiIcons.chevronDown,
                          size: 65,
                        ),
                      ],
                    )),
              ),
              // ignore: avoid_unnecessary_containers
              Container(
                  constraints: const BoxConstraints(maxHeight: 380),
                  margin: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                  ),
                  child: GridView.count(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      children: <Widget>[
                        Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Neew()));
                              },
                              child: Column(
                                children: [
                                  Icon(
                                    MdiIcons.plusBoxOutline,
                                    color: Colors.black,
                                    size: 60,
                                  ),
                                  const Text('        Novo \nAgendamento',
                                      style: TextStyle(color: Colors.black))
                                ],
                              ),
                            )),
                        Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Agendaments()));
                              },
                              child: Column(
                                children: [
                                  Icon(
                                    MdiIcons.textBoxCheckOutline,
                                    color: Colors.black,
                                    size: 60,
                                  ),
                                  const Text('         Meus \nAgendamentos',
                                      style: TextStyle(color: Colors.black))
                                ],
                              ),
                            )),
                        Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => History()));
                              },
                              child: Column(
                                children: [
                                  Icon(
                                    MdiIcons.history,
                                    color: Colors.black,
                                    size: 60,
                                  ),
                                  const Text('    Hist??rico de\n Agendamentos',
                                      style: TextStyle(color: Colors.black))
                                ],
                              ),
                            )),
                        Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Pricetable()));
                              },
                              child: Column(
                                children: [
                                  Icon(
                                    MdiIcons.cashMultiple,
                                    color: Colors.black,
                                    size: 60,
                                  ),
                                  const Text('Tabela de\n  Valores',
                                      style: TextStyle(color: Colors.black))
                                ],
                              ),
                            )),
                        Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => About()));
                              },
                              child: Column(
                                children: [
                                  Icon(
                                    MdiIcons.helpCircleOutline,
                                    color: Colors.black,
                                    size: 60,
                                  ),
                                  const Text('Informa????es',
                                      style: TextStyle(color: Colors.black))
                                ],
                              ),
                            )),
                        Container(
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            child: TextButton(
                              onPressed: () {
                                exit(0);
                              },
                              child: Column(
                                children: [
                                  Icon(
                                    MdiIcons.powerStandby,
                                    color: Colors.black,
                                    size: 60,
                                  ),
                                  const Text('Sair',
                                      style: TextStyle(color: Colors.black))
                                ],
                              ),
                            )),
// TROCAR ISSO DEPOIS PRA UM LUGAR MELHOR T?? NUM LUGAR HORRIVEL
// IIIIIIIIIIIIIIIIIII
// IIIIIIIIIIIIIIIIII
// IIIIIIIIIIIIIIIIIII

//IIIIIIIIIIIIIIIIIIII
//IIIIIIIIIIIIIIIIIIIII
//IIIIIIIIIIIIIIIIIIIII
                      ])),
            ],
          ),
        ));
  }

  @override
  Widget icones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(onPressed: Facebook, icon: const Icon(Icons.facebook)),
        IconButton(onPressed: Twitter, icon: const Icon(MdiIcons.twitter)),
        IconButton(onPressed: Instagram, icon: const Icon(MdiIcons.instagram)),
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
