class PaymentConstants {
  static const String baseUrl = 'https://accept.paymob.com/api/';
  static const String getAuthTokenEndpoint = 'auth/tokens';
  static const String getOrderIDEndpoint = 'ecommerce/orders';
  static const String getPaymentIDEndpoint = 'acceptance/payment_keys';
  static const String getRefCodeEndpoint = 'acceptance/payments/pay';

  static String visaUrl =
      '${baseUrl}acceptance/iframes/839447?payment_token=$paymentFinalToken';
  static String visaUrl2 =
      '${baseUrl}acceptance/iframes/839446?payment_token=$paymentFinalToken';

  static const String paymentApiKey =
      'ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2T1RjeU1EVXpMQ0p1WVcxbElqb2lhVzVwZEdsaGJDSjkuSmYtbW5JV3MtWEdfOWRtWXBpSnY1ZGs4MW55cmpkeHNQS210M1E4UVoxMUxnbTg5ZE1aRkZtWkZ6ZXRFVTM1SzdQdlBGY1BNYndycmpBYkN2THRwdHc=';

  static String paymentFinalToken = '';
  static String paymentRefCode = '';
  static String paymentAuthToken = '';
  static String paymentOrderID = '';

  static const String integrationOnlineCardID = '4559590';
  static const String integrationKioskID = '4576828';
}
