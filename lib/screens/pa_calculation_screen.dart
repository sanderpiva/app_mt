import 'package:flutter/material.dart';
import 'dart:math';

class PACalculationScreen extends StatefulWidget {
  const PACalculationScreen({Key? key}) : super(key: key);

  @override
  _PACalculationScreenState createState() => _PACalculationScreenState();
}

class _PACalculationScreenState extends State<PACalculationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _primeiroTermoController = TextEditingController();
  final _razaoController = TextEditingController();
  final _posicaoController = TextEditingController();
  String result = '';

  void _validateAndCalculate() {
    if (_formKey.currentState!.validate()) {
      double primeiroTermo = double.parse(_primeiroTermoController.text);
      double razao = double.parse(_razaoController.text);
      int posicao = int.parse(_posicaoController.text);
      // Variáveis intermediárias para a lógica
      double resultadoPosicaoMenosUm = (posicao - 1).toDouble();
      double resultadoPosicaoElevadoPosicaoMenosUm =
      pow(razao, resultadoPosicaoMenosUm).toDouble();
      double resutadoPosicaoMenosUmVezesRazao = resultadoPosicaoMenosUm * razao;

      double resultado = primeiroTermo + (posicao - 1) * razao;

      setState(() {
        result =
        'O ${posicao}º termo da PA é ${resultado.toStringAsFixed(2)}: '
            '${primeiroTermo} + (${posicao} - 1) * ${razao} = '
            '${primeiroTermo} + ${resultadoPosicaoMenosUm} * ${razao} = '
            '${primeiroTermo} + ${resutadoPosicaoMenosUmVezesRazao} = '
            '${resultado.toStringAsFixed(2)}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cálculo de PA')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _primeiroTermoController,
                decoration: const InputDecoration(labelText: 'Primeiro Termo (a1)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Informe o primeiro termo';
                  if (double.tryParse(value) == null) return 'Digite um número válido';
                  return null;
                },
              ),
              TextFormField(
                controller: _razaoController,
                decoration: const InputDecoration(labelText: 'Razão (r)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Informe a razão';
                  if (double.tryParse(value) == null) return 'Digite um número válido';
                  return null;
                },
              ),
              TextFormField(
                controller: _posicaoController,
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
