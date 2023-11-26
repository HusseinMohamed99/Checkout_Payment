import 'package:flutter/material.dart';

void main() {
  runApp(const CheckoutPayment());
}

class CheckoutPayment extends StatelessWidget {
  const CheckoutPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(textTheme: const TextTheme()),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
