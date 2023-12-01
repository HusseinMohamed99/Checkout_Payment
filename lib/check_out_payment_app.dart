import 'package:flutter/material.dart';

class CheckoutPaymentApp extends StatelessWidget {
  const CheckoutPaymentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(textTheme: const TextTheme()),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material  App Bar'),
        ),
        body: const Center(
          child: Text('Hello  World'),
        ),
      ),
    );
  }
}
