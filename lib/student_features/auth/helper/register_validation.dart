import 'package:field_training_app/Core/utils/routes.dart';
import 'package:field_training_app/Core/widgets/custom_cherry_toast.dart';
import 'package:field_training_app/student_features/auth/presentation/view_model/teacher_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Core/utils/app_regex.dart';
import '../presentation/view_model/student_cubit.dart';

void registerValidation(
    BuildContext context,
    String optionState,
    TextEditingController nameController,
    TextEditingController emailController,
    TextEditingController phoneController,
    TextEditingController passwordController) {
  if (!AppRegex.isArabic(nameController.text)) {
    errorCherryToast(context, "حدث خطأ", 'يجب ان يكون الأسم باللغة العربية');
  } else if (!AppRegex.isEmailValid(emailController.text)) {
    errorCherryToast(context, "حدث خطأ", 'البريد الالكتروني غير صحيح');
  } else if (!AppRegex.isPhoneNumberValid(phoneController.text)) {
    errorCherryToast(context, "حدث خطأ", 'رقم الجوال غير صحيح');
  } else if (!AppRegex.hasMinLength(passwordController.text)) {
    errorCherryToast(context, "حدث خطأ", 'كلمة المرور قصيرة جداً');
  } else if (optionState == 'طالب') {
    context.read<StudentCubit>().setStudentData(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        studentOrTeacher: optionState);

    successCherryToast(
      context,
      "تم التسجيل بنجاح",
      'قم بتاكيد البريد الالكتروني لتفعيل حسابك',
    );

    Navigator.pushNamed(context, Routes.loginViewRoute);
  } else {
    context.read<TeacherCubit>().setTeacherData(
          name: nameController.text,
          email: emailController.text,
          phone: phoneController.text,
          password: passwordController.text,
          studentOrTeacher: optionState,
        );

    Navigator.pushNamed(context, Routes.teacherAddressViewRoute);
  }
}
