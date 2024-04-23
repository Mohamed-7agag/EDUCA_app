import 'package:equatable/equatable.dart';
import 'package:field_training_app/Core/api_services/end_points.dart';
import 'package:field_training_app/cache/cache_helper.dart';
import 'package:field_training_app/student_features/auth/data/repos/auth_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_cubit_state.dart';

class AuthCubitCubit extends Cubit<AuthCubitState> {
  AuthCubitCubit(this.authRepo) : super(AuthCubitInitial());

  final AuthRepo authRepo;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  //! Login method
  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      emit(AuthCubitLoginLoading());
      var result = await authRepo.login(
        name: nameController.text.trim(),
        password: passwordController.text.trim(),
      );
      result.fold((failure) {
        emit(AuthCubitLoginFailure(errMessage: failure.errMessage));
      }, (loginModel) {
        emit(AuthCubitLoginSuccess());
        CacheHelper.saveData(key: ApiKey.token, value: loginModel.token);
        //? save token in shared preferences
      });
    }
  }

    //! Student Register method
  Future<void> studentRegister() async {
    if (formKey.currentState!.validate()) {
      emit(AuthCubitRegisterLoading());
      var result = await authRepo.studentRegister(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        phone: phoneController.text.trim(),
        address: addressController.text.trim(),
      );
      result.fold((failure) {
        emit(AuthCubitRegisterFailure(errMessage: failure.errMessage));
      }, (loginModel) {
        emit(AuthCubitRegisterSuccess());
      });
    }
  }

  // Teacher registration method
  Future<void> teacherRegister() async {
    if (formKey.currentState!.validate()) {}
  }
}
