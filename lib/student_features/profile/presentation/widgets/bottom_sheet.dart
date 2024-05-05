// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../Core/utils/constatnt.dart';
import '../../../../Core/utils/styles.dart';
import '../../../auth/presentation/view_model/auth_cubit/auth_cubit.dart';
import '../../../auth/presentation/view_model/change_profile_image.dart';

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
                      context.read<AuthCubit>().image = pickedFile;
                      context
                          .read<ChangeRegisterImageCubit>()
                          .changeImage(pickedFile);
                      Navigator.of(context).pop();
                    }
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
                      context.read<AuthCubit>().image = pickedFile;
                      context
                          .read<ChangeRegisterImageCubit>()
                          .changeImage(pickedFile);
                      Navigator.of(context).pop();
                    }
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
