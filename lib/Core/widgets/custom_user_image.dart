import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../student_features/auth/presentation/view_model/change_profile_image.dart';
import '../../student_features/profile/presentation/widgets/bottom_sheet.dart';
import '../utils/constatnt.dart';

class CustomUserImage extends StatelessWidget {
  const CustomUserImage({
    super.key,
    required this.radius,
    required this.iconSize,
    required this.right,
    required this.top,
    required this.cameraSize,
    this.isRegister = false,
  });
  final double radius;
  final double iconSize;
  final double right;
  final double top;
  final double cameraSize;
  final bool? isRegister;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeProfileImageCubit, XFile?>(
      builder: (context, state) {
        return Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(2.5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(200),
                border: state != null
                    ? Border.all(color: kPrimaryColor, width: 2)
                    : null,
              ),
              child: CircleAvatar(
                radius: radius,
                backgroundColor: kSplashColor,
                backgroundImage:
                    state != null ? Image.file(File(state.path)).image : null,
                child: state == null
                    ? Icon(
                        Icons.person,
                        size: iconSize,
                        color: kPrimaryColor,
                      )
                    : null,
              ),
            ),
            Positioned(
              right: right,
              top: top,
              child: IconButton(
                onPressed: () {
                  bottomSheet(context, isRegister ?? false);
                },
                icon: Icon(
                  Icons.add_a_photo_outlined,
                  color: Colors.white,
                  size: cameraSize,
                ),
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    kPrimaryColor,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
