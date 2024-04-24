import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterOptionCubit extends Cubit<String> {
  RegisterOptionCubit() : super("");

  void changeRegisterOption(int option) {
    if (option == 0) {
      emit("طالب");
    } else {
      emit("معلم");
    }
  }
}
