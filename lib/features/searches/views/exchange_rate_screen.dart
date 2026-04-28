import 'package:flutter/material.dart';

class ExchangeRateScreen extends StatelessWidget {
  const ExchangeRateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exchange Rate Search')),
      body: const Center(child: Text('Exchange Rate Search Screen')),
    );
  }
}
