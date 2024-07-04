import 'package:flutter/material.dart';

class CustomImageView extends StatelessWidget {
  const CustomImageView({
    super.key,
    this.alignment,
    this.onTap,
    this.url,
    required this.imagePath,
    this.color,
    this.height,
    this.width,
    required this.fit,
  });

  final double? height;
  final double? width;
  final Color? color;
  final BoxFit fit;
  final Alignment? alignment;
  final VoidCallback? onTap;
  final String? url;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      width: width,
      height: height,
      fit: fit,
    );
  }
}
