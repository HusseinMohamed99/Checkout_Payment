import 'dart:developer';

import 'package:checkout_payment/Core/helpers/extensions.dart';
import 'package:checkout_payment/Core/networking/api_keys.dart';
import 'package:checkout_payment/Core/routing/routes.dart';
import 'package:checkout_payment/Core/widgets/custom_button.dart';
import 'package:checkout_payment/Features/cart/data/model/amount_model/amount_model.dart';
import 'package:checkout_payment/Features/cart/data/model/amount_model/details.dart';
import 'package:checkout_payment/Features/cart/data/model/item_list_model/item.dart';
import 'package:checkout_payment/Features/cart/data/model/item_list_model/item_list_model.dart';
import 'package:checkout_payment/Features/cart/logic/cubit/stripe_payment_cubit.dart';
import 'package:checkout_payment/Features/cart/logic/cubit/stripe_payment_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StripePaymentCubit, StripePaymentState>(
      listener: (context, state) {
        if (state is StripePaymentSuccess) {
          context.pushReplacementNamed(Routes.thankYouView);
        } else if (state is StripePaymentFailure) {
          context.pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
            ),
          );
        }
      },
      builder: (context, state) {
        return CustomButton(
          text: 'Continue',
          isLoading: state is StripePaymentLoading ? true : false,
          onTap: () {
            // PaymentIntentInputModel paymentIntentInputModel =
            //     PaymentIntentInputModel(
            //   amount: '100',
            //   currency: 'USD',
            //   customerId: 'cus_PKLCkhYOMWEOTS',
            // );
            // BlocProvider.of<StripePaymentCubit>(context).makePayment(
            //   paymentIntentInputModel: paymentIntentInputModel,
            // );
            var transactionsData = getTransactionsData();
            executePaypalPayment(context, transactionsData);
          },
        );
      },
    );
  }

  void executePaypalPayment(BuildContext context,
      ({AmountModel amount, ItemListModel itemList}) transactionsData) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: ApiKeys.paypalClientId,
          secretKey: ApiKeys.paypalSecretKey,
          transactions: [
            {
              "amount": transactionsData.amount.toJson(),
              "description": "The payment transaction description.",
              "item_list": transactionsData.itemList.toJson(),
            }
          ],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            log("onSuccess: $params");
            Navigator.pop(context);
          },
          onError: (error) {
            log("onError: $error");
            Navigator.pop(context);
          },
          onCancel: () {
            print('cancelled:');
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  ({AmountModel amount, ItemListModel itemList}) getTransactionsData() {
    var amount = AmountModel(
      total: '100',
      currency: 'USD',
      details: DetailsModel(
        subtotal: '100',
        shipping: '0',
        shippingDiscount: 0,
      ),
    );
    List<OrderItemModel> orders = [
      OrderItemModel(
        name: "Apple",
        quantity: 4,
        price: "10",
        currency: "USD",
      ),
      OrderItemModel(
        name: "Pineapple",
        quantity: 5,
        price: "12",
        currency: "USD",
      ),
    ];
    var itemList = ItemListModel(orders: orders);
    return (
      amount: amount,
      itemList: itemList,
    );
  }
}
