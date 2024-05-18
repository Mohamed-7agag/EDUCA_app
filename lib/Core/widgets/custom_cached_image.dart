import 'package:cached_network_image/cached_network_image.dart';
import 'package:field_training_app/Core/widgets/custom_loading_widget.dart';
import 'package:flutter/material.dart';

class CustomCachedImage extends StatelessWidget {
  const CustomCachedImage({super.key, required this.imageUrl,});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: 110,
        height: 110,
        fit: BoxFit.fill,
        errorWidget: (context, url, error) {
          return const Icon(
            Icons.error_outline_rounded,
            color: Colors.red,
            size: 30,
          );
        },
        progressIndicatorBuilder: (context, url, progress) {
          return const CustomLoadingWidget();
        },
      ),
    );
  }
}
