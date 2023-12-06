import 'package:checkout_payment/Core/routing/app_router.dart';
import 'package:checkout_payment/check_out_payment_app.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    DevicePreview(
      enabled: true,
      tools: const [
        ...DevicePreview.defaultTools,
      ],
      builder: (context) => CheckoutPaymentApp(
        appRouter: AppRouter(),
      ),
    ),
  );
}
