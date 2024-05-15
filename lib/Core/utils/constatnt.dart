import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xff0961F5);
const Color kSplashColor = Color(0x130960F5);
const Color kSplashDarkerColor = Color(0x150B64FE);
const Color kBackgroundColor = Color(0xFFFAFAFA);
const Color kShadowColor = Color(0x089E9E9E);

const String introScreenKey = "introScreen";
const String optionStateKey = "optionState";
const String termsKey = "terms";
const String passwordKey = "password";

List<String> questions = [
  'ما هو اطول نهر في العالم؟',
  'ما هي عاصمة فرنسا؟',
  'ما هي عاصمة اليابان؟',
  'ما هو اطول جبل في العالم؟',
];

List<List<String>> answers = [
  ['نهر الأمازون', 'نهر النيل', 'نهر اليانغتسي', 'نهر الميسيسيبي'],
  ['باريس', 'برلين', 'لندن', 'مدريد'],
  ['طوكيو', 'سيول', 'بكين', 'موسكو'],
  ['إيفرست', 'كيليمنجارو', 'ماكينلي', 'كانتستسنا'],
];

class PaymentConstants {
  static const String baseUrl = 'https://accept.paymob.com/api/';
  static const String getAuthTokenEndpoint = 'auth/tokens';
  static const String getOrderIDEndpoint = 'ecommerce/orders';
  static const String getPaymentIDEndpoint = 'acceptance/payment_keys';
  static const String getRefCodeEndpoint = 'acceptance/payments/pay';

  static String visaUrl =
      '${baseUrl}acceptance/iframes/839447?payment_token=$paymentFinalToken';

  static const String paymentApiKey =
      'ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2T1RjeU1EVXpMQ0p1WVcxbElqb2lhVzVwZEdsaGJDSjkuSmYtbW5JV3MtWEdfOWRtWXBpSnY1ZGs4MW55cmpkeHNQS210M1E4UVoxMUxnbTg5ZE1aRkZtWkZ6ZXRFVTM1SzdQdlBGY1BNYndycmpBYkN2THRwdHc=';

  static String paymentFinalToken = '';
  static String paymentRefCode = '';
  static String paymentAuthToken = '';
  static String paymentOrderID = '';

  static const String integrationOnlineCardID = '4559590';
  static const String integrationKioskID = '4576828';
}
