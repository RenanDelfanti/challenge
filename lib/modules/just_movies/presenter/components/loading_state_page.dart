import 'package:flutter/material.dart';

class LoadingStatePage extends StatelessWidget {
  const LoadingStatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
