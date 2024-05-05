import 'package:flutter/material.dart';
import '../utils/constatnt.dart';

class ProfileUserImage extends StatelessWidget {
  const ProfileUserImage({
    super.key,
    required this.radius,
    required this.iconSize,
    required this.right,
    required this.top,
    required this.cameraSize,
    this.image,
  });
  final double radius;
  final double iconSize;
  final double right;
  final double top;
  final double cameraSize;
  final String? image;

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
            border: image != null
                ? Border.all(color: kPrimaryColor, width: 2)
                : null,
          ),
          child: CircleAvatar(
            radius: radius,
            backgroundColor: kSplashColor,
            backgroundImage: image != null ? Image.network(image!).image : null,
            child: image == null
                ? Icon(
                    Icons.person,
                    size: iconSize,
                    color: kPrimaryColor,
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
