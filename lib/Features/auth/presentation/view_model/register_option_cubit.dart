import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterOptionCubit extends Cubit<String> {
  RegisterOptionCubit() : super("student");

  void changeRegisterOption(int option) {
    if (option == 0) {
      emit("student");
    } else {
      emit("teacher");
    }
  }
}
