import 'dart:developer';

import 'package:checkout_payment/Features/cart/data/model/payment_intent_input/payment_intent_input_model.dart';
import 'package:checkout_payment/Features/cart/data/repos/checkout_repo.dart';
import 'package:checkout_payment/Features/cart/logic/cubit/stripe_payment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StripePaymentCubit extends Cubit<StripePaymentState> {
  StripePaymentCubit(this.checkOutRepo) : super(StripePaymentInitial());

  final CheckOutRepo checkOutRepo;
  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    emit(StripePaymentLoading());
    var response = await checkOutRepo.makePayment(
        paymentIntentInputModel: paymentIntentInputModel);
    response.fold(
      (failed) => emit(StripePaymentFailure(errorMessage: failed.errorMessage)),
      (success) => emit(StripePaymentSuccess()),
    );
  }

  @override
  void onChange(Change<StripePaymentState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
