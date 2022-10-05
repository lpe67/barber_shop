class Agenda {
  String name_agenda;
  String telefone_agenda;
  String email_agenda;
  String data_agenda;

  Agenda({
    required this.name_agenda,
    required this.telefone_agenda,
    required this.email_agenda,
    required this.data_agenda,
  });

  Map<String, dynamic> toMap() {
    return {
      'name_agenda': name_agenda,
      'telefone_agenda': telefone_agenda,
      'email_agenda': email_agenda,
      'data_agenda': data_agenda,
    };
  }

  factory Agenda.fromMap(Map<String, dynamic> map) {
    return Agenda(
      name_agenda: map['name_agenda'],
      telefone_agenda: map['telefone_agenda'],
      email_agenda: map['email_agenda'],
      data_agenda: map['data_agenda'],
    );
  }
}
