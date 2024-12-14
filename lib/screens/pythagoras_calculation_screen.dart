import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/services.dart';

class PythagorasCalculationScreen extends StatefulWidget {
  const PythagorasCalculationScreen({Key? key}) : super(key: key);

  @override
  State<PythagorasCalculationScreen> createState() => _PythagorasCalculationScreenState();
}

class _PythagorasCalculationScreenState extends State<PythagorasCalculationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _oppositeSideController = TextEditingController();
  final _adjacentSideController = TextEditingController();
  String result = '';

  void _calculateHypotenuse() {
    if (_formKey.currentState!.validate()) {
      double oppositeSide = double.parse(_oppositeSideController.text);
      double adjacentSide = double.parse(_adjacentSideController.text);
      double hypotenuse = sqrt(oppositeSide * oppositeSide + adjacentSide * adjacentSide);
      double oppositeSideSquare = oppositeSide * oppositeSide;
      double adjacentSideSquare = adjacentSide * adjacentSide;

      setState(() {
        result = 'Hipotenusa = \u221A(${ (oppositeSide * oppositeSide + adjacentSide * adjacentSide).toStringAsFixed(2)}) = ${hypotenuse.toStringAsFixed(2)}, pois:\n\n'
            'Hipotenusa² = (cateto oposto)² + (cateto adjacente)²\n'
            'Hipotenusa² = (${oppositeSide.toStringAsFixed(2)} * ${oppositeSide.toStringAsFixed(2)}) + (${adjacentSide.toStringAsFixed(2)} * ${adjacentSide.toStringAsFixed(2)})\n'
            'Hipotenusa² = ${oppositeSideSquare} + ${adjacentSideSquare}\n'
            'Hipotenusa² = ${ (oppositeSide * oppositeSide + adjacentSide * adjacentSide).toStringAsFixed(2)}\n'
            'Hipotenusa = \u221A(${ (oppositeSide * oppositeSide + adjacentSide * adjacentSide).toStringAsFixed(2)}) = ${hypotenuse.toStringAsFixed(2)}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      appBar: AppBar(title: const Text('Teorema de Pitágoras')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text(
                'Segundo Teorema, o quadrado da hipotensa é igual ao quadrado dos catetos. Pratique:',
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 4),
              TextFormField(
                controller: _oppositeSideController,
                decoration: const InputDecoration(labelText: 'Cateto oposto'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Por favor insira um valor';
                  if (double.tryParse(value) == null) return 'Valor inválido';
                  return null;
                },
              ),
              TextFormField(
                controller: _adjacentSideController,
                decoration: const InputDecoration(labelText: 'Cateto adjacente'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Por favor insira um valor';
                  if (double.tryParse(value) == null) return 'Valor inválido';
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calculateHypotenuse,
                child: const Text('Calcular Hipotensua'),
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