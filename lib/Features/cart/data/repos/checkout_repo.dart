import 'package:checkout_payment/Core/errors/failures.dart';
import 'package:checkout_payment/Features/cart/data/model/payment_intent_input/payment_intent_input_model.dart';
import 'package:dartz/dartz.dart';

abstract class CheckOutRepo {
  Future<Either<Failure, void>> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  });
}
