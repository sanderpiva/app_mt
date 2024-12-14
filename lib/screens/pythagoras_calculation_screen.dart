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
  final _catetoOpostoController = TextEditingController();
  final _catetoAdjacenteController = TextEditingController();
  String result = '';

  void _calculateHypotenuse() {
    if (_formKey.currentState!.validate()) {
      double catetoOposto = double.parse(_catetoOpostoController.text);
      double catetoAjacente = double.parse(_catetoAdjacenteController.text);
      double hypotenuse = sqrt(catetoOposto * catetoOposto + catetoAjacente * catetoAjacente);
      double catetoOpostoQuadrado = catetoOposto * catetoOposto;
      double catetoAdjacenteQuadrado = catetoAjacente * catetoAjacente;

      setState(() {
        result = 'Hipotenusa = \u221A(${ (catetoOposto * catetoOposto + catetoAjacente * catetoAjacente).toStringAsFixed(2)}) = ${hypotenuse.toStringAsFixed(2)}, pois:\n\n'
            'Hipotenusa² = (cateto oposto)² + (cateto adjacente)²\n'
            'Hipotenusa² = (${catetoOposto.toStringAsFixed(2)} * ${catetoOposto.toStringAsFixed(2)}) + (${catetoAjacente.toStringAsFixed(2)} * ${catetoAjacente.toStringAsFixed(2)})\n'
            'Hipotenusa² = ${catetoOpostoQuadrado} + ${catetoAdjacenteQuadrado}\n'
            'Hipotenusa² = ${ (catetoOposto * catetoOposto + catetoAjacente * catetoAjacente).toStringAsFixed(2)}\n'
            'Hipotenusa = \u221A(${ (catetoOposto * catetoOposto + catetoAjacente * catetoAjacente).toStringAsFixed(2)}) = ${hypotenuse.toStringAsFixed(2)}';
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
                controller: _catetoOpostoController,
                decoration: const InputDecoration(labelText: 'Cateto oposto'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Por favor insira um valor';
                  if (double.tryParse(value) == null) return 'Valor inválido';
                  return null;
                },
              ),
              TextFormField(
                controller: _catetoAdjacenteController,
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