import 'package:field_training_app/Core/widgets/custom_cached_image.dart';
import 'package:flutter/material.dart';
import '../utils/constatnt.dart';

class ProfileUserImage extends StatelessWidget {
  const ProfileUserImage({
    super.key,
    required this.iconSize,
    required this.right,
    required this.top,
    required this.cameraSize,
    this.image,
  });
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
          child: image == null
              ? Icon(
                  Icons.person,
                  size: iconSize,
                  color: kPrimaryColor,
                )
              : CustomCachedImage(
                  imageUrl: image ?? '',
                  width: 115,
                  height: 115,
                  errorIconSize: 60,
                ),
        ),
      ],
    );
  }
}
