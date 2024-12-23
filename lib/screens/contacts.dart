import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../componentes/appbar.dart';
import '../componentes/drawer.dart';


class ContactsPage extends StatelessWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      appBar: const MyAppBar(title: 'Contato via email'),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: const Text(
          'CONTATO DOS DESENVOLVEDORES:\n\n'
              'Darlene Souza: \n'
              'darlene.leao@alunos.ifsuldeminas.edu.br\n\n'
              'Marcelo Ferreira:\n'
              'marcelo.ferreira@alunos.ifsuldeminas.edu.br\n\n'
              'Renan Rocha:\n'
              'renan.rocha@alunos.ifsuldeminas.edu.br\n\n'
              'Sander Piva:\n'
              'sander.piva@alunos.ifsuldeminas.edu.br\n\n',
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            height: 1.5,
          ),
        ),
      ),
    );
  }
}
