import 'package:flutter/material.dart';

class PercentageCalculationScreen extends StatefulWidget {
  const PercentageCalculationScreen({Key? key}) : super(key: key);

  @override
  _PercentageCalculationScreenState createState() => _PercentageCalculationScreenState();
}

class _PercentageCalculationScreenState extends State<PercentageCalculationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _valueController = TextEditingController();
  final _percentageController = TextEditingController();
  String result = '';

  void _validateAndCalculate() {
    if (_formKey.currentState!.validate()) {
      double value = double.parse(_valueController.text);
      double percentage = double.parse(_percentageController.text);
      double percentagemDividido100 = percentage/100;
      double umMenospercentagemDividido100 = 1 - percentagemDividido100;
      double calculatedPercentage = (value * percentage) / 100;
      double divisor = 100;
      double res = percentage * value;

      setState(() {
        /*
        result = '${percentage.toStringAsFixed(2)}% de ${value.toStringAsFixed(2)}' +
            ' = ${calculatedPercentage.toStringAsFixed(2)}:\n'
                '${value.toStringAsFixed(2)} * (1 - (${percentage} / 100) =' +
            '\n${value.toStringAsFixed(2)} * ${umMenospercentagemDividido100} = '
                '${calculatedPercentage.toStringAsFixed(2)}';*/

        result = '${percentage.toStringAsFixed(2)}% de ${value.toStringAsFixed(2)}' +
            ' = ${calculatedPercentage.toStringAsFixed(2)}:\n'
                '(${percentage.toStringAsFixed(2)} * ${value.toStringAsFixed(2)})/ ${divisor} =' +
            '\n${res} / $divisor = ${calculatedPercentage.toStringAsFixed(2)}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculo da Porcentagem')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _valueController,
                decoration: const InputDecoration(labelText: 'Valor'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Por favor entre um valor';
                  if (double.tryParse(value) == null) return 'Por favor entre com um numero valido';
                  return null;
                },
              ),
              TextFormField(
                controller: _percentageController,
                decoration: const InputDecoration(labelText: 'Porcentagem'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Por favor entre com valor da porcentagem';
                  if (double.tryParse(value) == null) return 'Por favor entre com um numero valido';
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _validateAndCalculate,
                child: const Text('Calcular Porcentagem'),
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