import 'screens/contacts_page.dart';
import 'screens/documents_page.dart';
import 'package:flutter/material.dart';
import 'homepage.dart';
import 'screens/calculation_page.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Matemático',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        '/home': (context) => HomePage(),
        '/documents': (context) => const DocumentsPage(),
        '/contacts': (context) => const ContactsPage(),
        '/calculation': (context) => const CalculationPage(),
      },
    );
  }
}
