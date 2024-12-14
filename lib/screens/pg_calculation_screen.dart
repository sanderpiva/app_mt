import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/services.dart';

class PGCalculationScreen extends StatefulWidget {
  const PGCalculationScreen({Key? key}) : super(key: key);

  @override
  _PGCalculationScreenState createState() => _PGCalculationScreenState();
}

class _PGCalculationScreenState extends State<PGCalculationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstTermController = TextEditingController();
  final _reasonController = TextEditingController();
  final _positionController = TextEditingController();
  String result = '';

  void _validateAndCalculate() {
    if (_formKey.currentState!.validate()) {
      double firstTerm = double.parse(_firstTermController.text);
      double reason = double.parse(_reasonController.text);
      int position = int.parse(_positionController.text);

      double positionMinusOneResult = (position - 1).toDouble();
      double positionElevatedPositionMinusOneResult =
      pow(reason, positionMinusOneResult).toDouble();

      double resultPGgeneralTerm = firstTerm * pow(reason, (position - 1).toDouble());

      setState(() {
        result =
            'an = a1 * q ^ (n - 1)\n'
            'a${position} = ${firstTerm} * (${reason}) ^ (${position} - 1)\n'
            'a${position} = ${firstTerm} * (${reason}) ^ (${positionMinusOneResult})\n'
            'a${position} = ${firstTerm} * ${positionElevatedPositionMinusOneResult}\n'
            'a${position} = ${resultPGgeneralTerm.toStringAsFixed(2)}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      appBar: AppBar(title: const Text('Cálculo de PG')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text (
                'Sequência de numeros não nulos em que cada termo posterior, a partir do segundo, é igual ao anterior multiplicado por um número fixo q. Pratique:',
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 4),
              TextFormField(
                controller: _firstTermController,
                decoration: const InputDecoration(labelText: 'Primeiro Termo (a1)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Informe o primeiro termo';
                  if (double.tryParse(value) == null) return 'Digite um número válido';
                  return null;
                },
              ),
              TextFormField(
                controller: _reasonController,
                decoration: const InputDecoration(labelText: 'Razão (q)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Informe a razão';
                  if (double.tryParse(value) == null) return 'Digite um número válido';
                  return null;
                },
              ),
              TextFormField(
                controller: _positionController,
                decoration: const InputDecoration(labelText: 'Posição (n)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Informe a posição';
                  if (int.tryParse(value) == null) return 'Digite um número inteiro válido';
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _validateAndCalculate,
                child: const Text('Calcular Termo Geral'),
              ),
              const SizedBox(height: 20),
              Text(result, style: const TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
}
