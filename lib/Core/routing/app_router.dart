import 'package:checkout_payment/Core/routing/routes.dart';
import 'package:checkout_payment/Features/cart/ui/cart_view.dart';
import 'package:checkout_payment/Features/cart/ui/payment_details.dart';
import 'package:checkout_payment/Features/cart/ui/thank_you_view.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ( arguments as ClassName )
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.cartScreen:
        return MaterialPageRoute(
          builder: (_) => const CartView(),
        );
      case Routes.paymentDetailsView:
        return MaterialPageRoute(
          builder: (_) => const PaymentDetailsView(),
        );
      case Routes.thankYouView:
        return MaterialPageRoute(
          builder: (_) => const ThankYouView(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
