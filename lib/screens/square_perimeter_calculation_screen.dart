import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
            'Perimetro do quadrado = 4 x lado: 4 * ${side} = ${perimeter.toStringAsFixed(2)}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      appBar: AppBar(title: const Text('Perímetro do Quadrado')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text (
                'Perímetro quadrado: Considerando que os lados (L) do quadrado são iguais, o perímetro do quadrado (P) pode ser obtido por meio de duas fórmulas, sendo: P = L + L + L + L ou P = 4 x L. Realize um exercício prático:',
                textAlign: TextAlign.justify,
              ),
              SizedBox(height: 26),
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