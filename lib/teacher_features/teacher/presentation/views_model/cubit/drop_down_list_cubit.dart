import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DropDownListCubit extends Cubit<String> {
  DropDownListCubit() : super("اختر");
  String lev = "اختر الصف الدراسي";
  String sub = "اخنر المادة الدراسية";
  String price = "اختر السعر";
  String term = "اختر الترم";
  TextEditingController descriptionController = TextEditingController();
  void changeIndexDropDownListLevel(String ch) {
    lev = ch;
    emit(ch);
  }

  void changeIndexDropDownListsubject(String ch) {
    sub = ch;
    emit(ch);
  }

  void changeIndexDropDownListprice(String ch) {
    price = ch;
    emit(ch);
  }

  void changeIndexDropDownListterm(String ch) {
    term = ch;
    emit(ch);
  }
}
