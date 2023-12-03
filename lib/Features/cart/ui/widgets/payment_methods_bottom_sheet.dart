import 'package:checkout_payment/Core/helpers/extensions.dart';
import 'package:checkout_payment/Core/routing/routes.dart';
import 'package:checkout_payment/Core/widgets/custom_button.dart';
import 'package:checkout_payment/Features/cart/ui/widgets/payment_methods_list_view.dart';
import 'package:flutter/material.dart';

class PaymentMethodsBottomSheet extends StatefulWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  State<PaymentMethodsBottomSheet> createState() =>
      _PaymentMethodsBottomSheetState();
}

class _PaymentMethodsBottomSheetState extends State<PaymentMethodsBottomSheet> {
  bool isPaypal = false;

  updatePaymentMethod({required int index}) {
    if (index == 0) {
      isPaypal = false;
    } else {
      isPaypal = true;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 16,
          ),
          const PaymentMethodsListView(),
          const SizedBox(
            height: 32,
          ),
          CustomButton(
            text: 'Continue',
            onTap: () {
              context.pushNamed(Routes.paymentDetailsView);
            },
          ),
        ],
      ),
    );
  }
}
