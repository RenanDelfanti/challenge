import 'package:flutter/material.dart';

class ErrorStatePage extends StatelessWidget {
  const ErrorStatePage({super.key, this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.warning, size: 50),
          const SizedBox(height: 10),
          Text(message ?? 'Falha ao obter dados.'),
        ],
      ),
    );
  }
}
