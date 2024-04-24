import 'package:flutter/material.dart';
import '../../student_features/profile/presentation/widgets/bottom_sheet.dart';
import '../models/user_model.dart';
import '../utils/constatnt.dart';

class CustomUserImage extends StatelessWidget {
  const CustomUserImage({
    super.key,
    required this.user,
    required this.radius,
    required this.iconSize,
    required this.right,
    required this.top,
    required this.cameraSize,
  });
  final UserModel user;
  final double radius;
  final double iconSize;
  final double right;
  final double top;
  final double cameraSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(2.5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(200),
            border: user.image == null
                ? null
                : Border.all(color: kPrimaryColor, width: 2),
          ),
          child: CircleAvatar(
            radius: radius,
            backgroundColor: kSplashColor,
            backgroundImage: user.image == null ? null : FileImage(user.image!),
            child: user.image == null
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
              bottomSheet(context);
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
  }
}
