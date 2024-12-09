import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("Aplicativo Matemático"),
              accountEmail: Text("players@gmail.com"),
              currentAccountPicture: CircleAvatar(
               backgroundImage: AssetImage('assets/img/logo.jpg'), // Replace with your image path
               backgroundColor: Colors.transparent, // Transparent background for image visibility

              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Alunos'),
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
