import 'package:checkout_payment/Core/errors/failures.dart';
import 'package:checkout_payment/Core/networking/stripe_service.dart';
import 'package:checkout_payment/Features/cart/data/model/payment_intent_input/payment_intent_input_model.dart';
import 'package:checkout_payment/Features/cart/data/repos/checkout_repo.dart';
import 'package:dartz/dartz.dart';

class CheckOutRepoImpl extends CheckOutRepo {
  final StripeService stripeService = StripeService();
  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeService.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
