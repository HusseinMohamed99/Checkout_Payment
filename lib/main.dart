import 'package:checkout_payment/Core/networking/api_keys.dart';
import 'package:checkout_payment/Core/routing/app_router.dart';
import 'package:checkout_payment/check_out_payment_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() {
  Stripe.publishableKey = ApiKeys.stripeApiPublishablekey;
  runApp(
    CheckoutPaymentApp(
      appRouter: AppRouter(),
    ),
  );
}
