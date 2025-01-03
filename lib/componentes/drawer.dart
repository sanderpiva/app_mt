import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("Aplicativo Matemático"),
              accountEmail: Text(""),
              currentAccountPicture: CircleAvatar(
               backgroundImage: AssetImage('assets/img/logo.jpg'),
               backgroundColor: Colors.transparent,

              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.folder),
              title: const Text('Breve documentação'),
              //onTap: () {},
              onTap: (){Navigator.pushNamed(context, '/documents');}
            ),
            ListTile(
                leading: const Icon(Icons.email),
                title: const Text('Contatos'),
                //onTap: () {},
                onTap: (){Navigator.pushNamed(context, '/contacts');}
            ),
            ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Área dos Alunos'),
                //onTap: () {},
                onTap: (){Navigator.pushNamed(context, '/calculation');}
            ),
            const Divider(
              //color: Colors.blue,
            ),
            ListTile(
              leading: const Icon(Icons.close),
              title: const Text('Sair'),
              //onTap: (){},
              onTap: () {Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);},

            ),
          ],
        ));
  }
}
