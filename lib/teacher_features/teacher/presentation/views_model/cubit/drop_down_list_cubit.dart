import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class DropDownListCubit extends Cubit<String> {
  DropDownListCubit() : super("..اختر");
  String lev = "..اختر";
  String sub = "..اختر";
   String price = "..اختر";
  String term = "..اختر";
  void changeIndexDropDownListLevel(String ch) {
    lev = ch;
    emit(ch);
  }
   void changeIndexDropDownListsubject(String ch) {
     sub= ch;
    emit(ch);
  }
  void changeIndexDropDownListprice(String ch) {
    price = ch;
    emit(ch);
  }
   void changeIndexDropDownListterm(String ch) {
     term= ch;
    emit(ch);
  }
}
