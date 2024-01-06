import 'package:checkout_payment/Core/networking/api_keys.dart';
import 'package:checkout_payment/Core/networking/api_service.dart';
import 'package:checkout_payment/Features/cart/data/model/customer_input_model.dart/customer_input_model.dart';
import 'package:checkout_payment/Features/cart/data/model/customer_model/customer_model.dart';
import 'package:checkout_payment/Features/cart/data/model/payment_intent_input/payment_intent_input_model.dart';
import 'package:checkout_payment/Features/cart/data/model/payment_intent_model/payment_intent_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  final ApiService apiService = ApiService();
  //1.  Create a Payment Intent
  Future<PaymentIntentModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    var response = await apiService.post(
      body: paymentIntentInputModel.toJson(),
      url: ApiKeys.urlPaymentIntent,
      token: ApiKeys.stripeApiSecretkey,
      contentType: Headers.formUrlEncodedContentType,
    );
    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);
    return paymentIntentModel;
  }

  // 2. initialize the payment sheet
  Future<void> initPaymentSheet({
    required String paymentIntentClientSecret,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        // Main params
        merchantDisplayName: 'Hussein Ammar',
        paymentIntentClientSecret: paymentIntentClientSecret,
        // Customer Keys
        customerEphemeralKeySecret: '',
        customerId: '',
      ),
    );
  }

// 3. present the payment sheet
  Future showPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    await initPaymentSheet(
        paymentIntentClientSecret: paymentIntentModel.clientSecret!);
    await showPaymentSheet();
  }

  // Create Customer
  Future<CustomerModel> createCustomer(
      CustomerInputModel customerInputModel) async {
    var response = await apiService.post(
      body: customerInputModel.toJson(),
      url: ApiKeys.urlCreateCustomer,
      token: ApiKeys.stripeApiSecretkey,
      contentType: Headers.formUrlEncodedContentType,
    );
    var customerModel = CustomerModel.fromJson(response.data);
    return customerModel;
  }
}
