class InitPaymentSheetInputModel {
  final String clientSecret;
  final String customerId;
  final String customerEphemeralKeySecret;

  InitPaymentSheetInputModel(
      {required this.clientSecret,
      required this.customerId,
      required this.customerEphemeralKeySecret});
}
