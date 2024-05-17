import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xff0961F5);
const Color kSplashColor = Color(0x130960F5);
const Color kSplashDarkerColor = Color(0x150B64FE);
const Color kSplashMoreDarkerColor = Color.fromARGB(39, 11, 100, 254);
const Color kBackgroundColor = Color(0xFFFAFAFA);
const Color kShadowColor = Color(0x089E9E9E);

const String introScreenKey = "introScreen";
const String optionStateKey = "optionState";
const String termsKey = "terms";
const String passwordKey = "password";
const String studentFirstName = "studentFirstName";
const String studentLastName = "studentLastName";
const String studentPhone = "studentPhone";
const String studentEmail = "studentEmail";

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

const List<String> governorates = [
  'الأقصر',
  'الإسكندرية',
  'أسيوط',
  'الجيزة',
  'البحيرة',
  'بني سويف',
  'دمياط',
  'الشرقية',
  'الاسماعيلية',
  'قنا',
  'أسوان',
  'البحر الأحمر',
  'بورسعيد',
  'القاهرة',
  'الدقهلية',
  'المنصورة',
  'الفيوم',
  'الغربية',
  'القليوبية',
  'كفر الشيخ',
  'المنيا',
  'المنوفية',
  'شمال سيناء',
  'جنوب سيناء',
  'السويس',
  'سوهاج',
  'الوادي الجديد',
];
