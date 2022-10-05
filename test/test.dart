class Agendaments extends StatelessWidget {
  const Agendaments({super.key});

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
                    icon: Icon(MdiIcons.arrowLeft))
              ],
            ),
            const Icon(
              Icons.add,
            ),
            AppBar(
              title: const Text("Clientes"),
            ),
            FutureBuilder(
              future: ContactRepository.findAll(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.none ||
                    snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                if (snapshot.data != null && snapshot.hasData) {
                  final agendas = snapshot.data! as List<Agenda>;
                  return Container(
                    margin: const EdgeInsets.all(16),
                    child: ListView.separated(
                      itemCount: contacts.length,
                      itemBuilder: (_, index) {
                        return ItemList(
                          agenda: agendas[index],
                        );
                      },
                      separatorBuilder: (_, index) {
                        return const Divider();
                      },
                    ),
                  );
                } else {
                  return const Center(
                    child: Text("Não existem clientes cadastrados"),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
