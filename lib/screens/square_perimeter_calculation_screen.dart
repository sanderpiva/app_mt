import 'package:flutter/material.dart';

class SquarePerimeterCalculationScreen extends StatefulWidget {
  const SquarePerimeterCalculationScreen({Key? key}) : super(key: key);

  @override
  State<SquarePerimeterCalculationScreen> createState() => _SquarePerimeterCalculationScreenState();
}

class _SquarePerimeterCalculationScreenState extends State<SquarePerimeterCalculationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _sideController = TextEditingController();
  String result = '';

  void _calculatePerimeter() {
    if (_formKey.currentState!.validate()) {
      double side = double.parse(_sideController.text);
      double perimeter = 4 * side;

      setState(() {
        result = 'Perímetro: ${perimeter.toStringAsFixed(2)}, pois:\n\n'
            'Perimetro do quadrado é o produto dos 4 lados: 4 * ${side} = ${perimeter.toStringAsFixed(2)}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perímetro do Quadrado')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _sideController,
                decoration: const InputDecoration(labelText: 'Lado do Quadrado'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Por favor insira um valor';
                  if (double.tryParse(value) == null) return 'Valor inválido';
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calculatePerimeter,
                child: const Text('Calcular Perimetro'),
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
