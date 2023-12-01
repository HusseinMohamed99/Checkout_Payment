import 'package:checkout_payment/Core/routing/app_router.dart';
import 'package:checkout_payment/Core/routing/routes.dart';
import 'package:flutter/material.dart';

class CheckoutPaymentApp extends StatelessWidget {
  const CheckoutPaymentApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Payment App',
      theme: ThemeData(textTheme: const TextTheme()),
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.cartScreen,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
