import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:barber_shop/screens/model/agenda.dart';
import 'package:barber_shop/screens/repository/agenda_repository.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class Neew extends StatefulWidget {
  const Neew({super.key});
  final titleStyle = const TextStyle(
      color: Colors.black, fontSize: 10, fontWeight: FontWeight.normal);

  @override
  State<Neew> createState() => _Neewagenda();
}

class _Neewagenda extends State<Neew> {
  var _isObscure = true;
  final _formKey = GlobalKey<FormState>();

  final name_agendaController = TextEditingController();
  final email_agendaController = TextEditingController();
  final telefone_agendaController =
      MaskedTextController(mask: "(00) 0000-0000");
  final data_agendaController = MaskedTextController(mask: "0000/00/00");

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
                    icon: Icon(MdiIcons.arrowLeft))
              ],
            ),
            Container(
              margin: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(children: [
                  TextFormField(
                    controller: name_agendaController,
                    validator: (text) => (text == null || text.length < 3)
                        ? "O nome do cliente é inválido"
                        : null,
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration(
                      label: Text("Nome do cliente"),
                      icon: Icon(Icons.account_box),
                    ),
                  ),
                  TextFormField(
                    controller: email_agendaController,
                    validator: (text) =>
                        (text == null || !EmailValidator.validate(text)
                            ? "O email digitado é inválido"
                            : null),
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      label: Text("Email"),
                      icon: Icon(Icons.email),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          validator: (text) =>
                              (text == null || text.length != 14)
                                  ? "O número do telefone é inválido"
                                  : null,
                          controller: telefone_agendaController,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            label: Text("Telefone"),
                            icon: Icon(Icons.call),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextFormField(
                    controller: data_agendaController,
                    validator: (text) =>
                        (text == null) ? "A data está faltando" : null,
                    decoration: InputDecoration(
                      label: const Text("AAAA/MM/DD"),
                      icon: const Icon(Icons.password),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isObscure = !_isObscure;
                          });
                        },
                        icon: Icon(
                          (_isObscure)
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                      ),
                    ),
                    obscureText: _isObscure,
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            final agenda = Agenda(
              name_agenda: name_agendaController.text,
              email_agenda: email_agendaController.text,
              telefone_agenda: telefone_agendaController.text,
              data_agenda: data_agendaController.text,
            );
            final result = await AgendaRepository.insertContact(agenda);
            String message;
            if (result != 0) {
              message = "Contato salvo com sucesso!!!";
            } else {
              message = "Lamento, não foi possível salvar o contato";
            }
            final snack = SnackBar(content: Text(message));
            ScaffoldMessenger.of(context).showSnackBar(snack);
          }
        },
        child: const Icon(
          Icons.save,
        ),
      ),
    );
  }
}
