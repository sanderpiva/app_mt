import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PACalculationScreen extends StatefulWidget {
  const PACalculationScreen({Key? key}) : super(key: key);

  @override
  _PACalculationScreenState createState() => _PACalculationScreenState();
}

class _PACalculationScreenState extends State<PACalculationScreen> {
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
      double positionMinusOneResultTimesReason = positionMinusOneResult * reason;

      double resultPAgeneralTerm = firstTerm + (position - 1) * reason;

      setState(() {
        result =
        'an = a1 + (n - 1) * r\n'
            'a${position} = ${firstTerm} + (${position} - 1) * ${reason}\n'
            'a${position} = ${firstTerm} + ${positionMinusOneResult} * ${reason}\n'
            'a${position} = ${firstTerm} + ${positionMinusOneResultTimesReason}\n'
            'a${position} = ${resultPAgeneralTerm.toStringAsFixed(2)}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      appBar: AppBar(title: const Text('Cálculo de PA')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text (
                'Sequência numérica em que cada termo, a partir do segundo, é igual ao anterior somado com um número fixo, chamado razão ou r. Pratique:',
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
                decoration: const InputDecoration(labelText: 'Razão (r)'),
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