import 'package:checkout_payment/Core/helpers/extensions.dart';
import 'package:checkout_payment/Core/routing/routes.dart';
import 'package:checkout_payment/Core/widgets/custom_button.dart';
import 'package:checkout_payment/Features/cart/data/model/payment_intent_input/payment_intent_input_model.dart';
import 'package:checkout_payment/Features/cart/logic/cubit/stripe_payment_cubit.dart';
import 'package:checkout_payment/Features/cart/logic/cubit/stripe_payment_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            PaymentIntentInputModel paymentIntentInputModel =
                PaymentIntentInputModel(
              amount: '100',
              currency: 'USD',
            );
            BlocProvider.of<StripePaymentCubit>(context).makePayment(
              paymentIntentInputModel: paymentIntentInputModel,
            );
          },
        );
      },
    );
  }
}
