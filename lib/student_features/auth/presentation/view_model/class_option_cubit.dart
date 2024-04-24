import 'package:flutter_bloc/flutter_bloc.dart';

class ClassOptionCubit extends Cubit<String> {
  ClassOptionCubit() : super("أختر الصف الدراسي");

  void changeState(String val) {
    emit(val);
  }
}