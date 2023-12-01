import 'package:checkout_payment/Core/routing/app_router.dart';
import 'package:checkout_payment/check_out_payment_app.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    CheckoutPaymentApp(
      appRouter: AppRouter(),
    ),
  );
}
