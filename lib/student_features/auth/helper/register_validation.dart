import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:field_training_app/Core/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    toast(context, 'يجب ان يكون الأسم باللغة العربية');
  } else if (!AppRegex.isEmailValid(emailController.text)) {
    toast(context, 'البريد الالكتروني غير صحيح');
  } else if (!AppRegex.isPhoneNumberValid(phoneController.text)) {
    toast(context, 'رقم الجوال غير صحيح');
  } else if (!AppRegex.hasMinLength(passwordController.text)) {
    toast(context, 'كلمة المرور قصيرة جداً');
  } else {
    context.read<StudentCubit>().setStudentData(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        studentOrTeacher: optionState);

    CherryToast.success(
      title: const Text("تم التسجيل بنجاح"),
      layout: ToastLayout.rtl,
      description: const Text('قم بتاكيد البريد الالكتروني لتفعيل حسابك',
          textAlign: TextAlign.right),
      animationType: AnimationType.fromTop,
      animationDuration: const Duration(milliseconds: 1000),
      autoDismiss: true,
      width: MediaQuery.of(context).size.width - 80.w,
    ).show(context);

    Navigator.pushNamed(context, Routes.loginViewRoute);
  }
}

void toast(BuildContext context, String message) {
  CherryToast.error(
    title: const Text("حدث خطأ"),
    layout: ToastLayout.rtl,
    description: Text(message),
    animationType: AnimationType.fromTop,
    animationDuration: const Duration(milliseconds: 1000),
    autoDismiss: true,
    width: MediaQuery.of(context).size.width - 80.w,
  ).show(context);
}
