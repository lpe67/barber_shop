import 'package:barber_shop/screens/model/agenda.dart';
import 'package:barber_shop/screens/repository/agenda_repository.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class EditAgenda extends StatefulWidget {
  final Agenda agenda;
  const EditAgenda({
    super.key,
    required this.agenda,
  });

  @override
  State<EditAgenda> createState() => _EditAgendaState();
}

class _EditAgendaState extends State<EditAgenda> {
  var _isObscure = true;
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController dataController;
  late final MaskedTextController phoneController;

  @override
  void initState() {
    nameController = TextEditingController(text: widget.agenda.name_agenda);
    emailController = TextEditingController(text: widget.agenda.email_agenda);
    phoneController = MaskedTextController(
        mask: "(00) 0000-0000", text: widget.agenda.telefone_agenda);
    dataController = MaskedTextController(
        mask: "0000/00/00", text: widget.agenda.data_agenda);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Editar ${widget.agenda.name_agenda}"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            final agenda = Agenda(
              id: widget.agenda.id,
              name_agenda: nameController.text,
              email_agenda: emailController.text,
              telefone_agenda: phoneController.text,
              data_agenda: dataController.text,
            );
            final result = await AgendaRepository.updateAgenda(agenda);
            String message;
            if (result != 0) {
              message = "Cliente salvo com sucesso";
            } else {
              message = "Não foi possível salvar o cliente";
            }
            final snack = SnackBar(content: Text(message));
            ScaffoldMessenger.of(context).showSnackBar(snack);
            Navigator.pop(context);
            Navigator.pop(context);
            Navigator.pop(context);
          }
        },
        child: const Icon(
          Icons.save,
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
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
                controller: emailController,
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
                      validator: (text) => (text == null || text.length != 14)
                          ? "O número do telefone é inválido"
                          : null,
                      controller: phoneController,
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
                controller: dataController,
                keyboardType: TextInputType.phone,
                validator: (text) =>
                    (text == null) ? "A data está faltando" : null,
                decoration: InputDecoration(
                  label: const Text("AAAA/MM/DD"),
                  icon: const Icon(Icons.calendar_month),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
