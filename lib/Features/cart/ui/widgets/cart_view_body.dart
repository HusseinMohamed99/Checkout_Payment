import 'package:checkout_payment/Core/theming/color_manager.dart';
import 'package:checkout_payment/Core/widgets/custom_button.dart';
import 'package:checkout_payment/Features/cart/data/repos/checkout_repo_impl.dart';
import 'package:checkout_payment/Features/cart/logic/cubit/stripe_payment_cubit.dart';
import 'package:checkout_payment/Features/cart/ui/widgets/cart_info_item.dart';
import 'package:checkout_payment/Features/cart/ui/widgets/payment_methods_bottom_sheet.dart';
import 'package:checkout_payment/Features/cart/ui/widgets/total_price_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 18,
          ),
          Expanded(child: Image.asset('assets/images/basket_image.png')),
          const SizedBox(
            height: 25,
          ),
          const OrderInfoItem(
            title: 'Order Subtotal',
            value: r'42.97$',
          ),
          const SizedBox(
            height: 3,
          ),
          const OrderInfoItem(
            title: 'Discount',
            value: r'0$',
          ),
          const SizedBox(
            height: 3,
          ),
          const OrderInfoItem(
            title: 'Shipping',
            value: r'8$',
          ),
          const Divider(
            thickness: 2,
            height: 34,
            color: ColorManager.dividerColor,
          ),
          const TotalPrice(title: 'Total', value: r'$50.97'),
          const SizedBox(
            height: 16,
          ),
          CustomButton(
            text: 'Complete Payment',
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  builder: (context) {
                    return BlocProvider(
                      create: (context) =>
                          StripePaymentCubit(CheckOutRepoImpl()),
                      child: const PaymentMethodsBottomSheet(),
                    );
                  });
            },
          ),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
