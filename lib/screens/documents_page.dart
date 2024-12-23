import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../componentes/appbar.dart';
import '../componentes/drawer.dart';

class DocumentsPage extends StatelessWidget {
  const DocumentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      appBar: const MyAppBar(title: 'Breve documentação'),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: const Text(
          'O aplicativo Matemático é uma ferramenta completa para auxiliar estudantes'
              ' de nível médio na aprendizagem de conteúdos matemáticos como Progressão Aritmética (PA), '
              'Progressão Geométrica (PG), Porcentagem, Proporção, Teorema de Pitágoras e Perímetro do quadrado. '
              '\n\nCom exercícios interativos e resolução passo a passo, o app oferece uma experiência de '
              'aprendizado personalizada. Além disso, videoaulas do YouTube '
              'complementam o conteúdo, aprofundando os conceitos. \n\n'
              'Basta inserir os dados e clicar em "calcular" para obter o passo a passo da resolução. '
              'Para um aprendizado mais aprofundado, acesse as videoaulas relacionadas ao tema.',
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            height: 1.5, // Altura da linha
          ),
        ),
      ),
    );
  }
}
