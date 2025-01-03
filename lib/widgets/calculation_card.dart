
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalculationCard extends StatelessWidget {
  final String title;
  final String asset;
  final Widget screen;

  const CalculationCard({
    Key? key,
    required this.title,
    required this.asset,
    required this.screen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Column(
        children: [
          Image.asset(asset, height: 150, fit: BoxFit.fill),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
