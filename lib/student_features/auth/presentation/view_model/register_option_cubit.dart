import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterOptionCubit extends Cubit<String> {
  RegisterOptionCubit() : super("");

  void changeRegisterOption(String option) {
    emit(option);
  }
}
