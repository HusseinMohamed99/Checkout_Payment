import 'package:checkout_payment/Core/widgets/custom_app_bar.dart';
import 'package:checkout_payment/Features/cart/ui/widgets/cart_view_body.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'My Cart'),
      body: const SafeArea(
        child: CartViewBody(),
      ),
    );
  }
}
