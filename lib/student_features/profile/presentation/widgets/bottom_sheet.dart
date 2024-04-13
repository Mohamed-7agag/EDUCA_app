// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:field_training_app/student_features/auth/presentation/view_model/student_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../Core/utils/constatnt.dart';
import '../../../../Core/utils/styles.dart';

void bottomSheet(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext ctx) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top: 40),
        height: 200.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                IconButton(
                  onPressed: () async {
                    final picker = ImagePicker();
                    final pickedFile =
                        await picker.pickImage(source: ImageSource.camera);
                    if (pickedFile != null) {
                      
                      context
                          .read<StudentCubit>()
                          .setStudentImage(image: File(pickedFile.path));
                    }
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.camera_alt,
                    size: 38,
                    color: kPrimaryColor,
                  ),
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(kSplashColor),
                    padding: MaterialStatePropertyAll(
                      EdgeInsets.all(12),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Text("الكاميرة", style: Styles.textStyle18),
              ],
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () async {
                    final picker = ImagePicker();
                    final pickedFile =
                        await picker.pickImage(source: ImageSource.gallery);
                    if (pickedFile != null) {
                     
                      context
                          .read<StudentCubit>()
                          .setStudentImage(image: File(pickedFile.path));
                    }
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.photo,
                    size: 38,
                    color: kPrimaryColor,
                  ),
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(kSplashColor),
                    padding: MaterialStatePropertyAll(
                      EdgeInsets.all(12),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                Text("المعرض", style: Styles.textStyle18),
              ],
            ),
          ],
        ),
      );
    },
  );
}
