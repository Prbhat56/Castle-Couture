import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CircularButton extends StatelessWidget {
  const CircularButton({
    super.key,
    required this.onTap,
    this.iconColor,
    this.backgroundColor,
    this.borderColor,
    this.text,
    this.height,
    this.width,
    this.isDisabled = false,
    this.margin,
    this.alignment,
    required this.icon,
    this.borderWidth,
  });

  final VoidCallback onTap;
  final Color? iconColor;
  final Color? backgroundColor;
  final Color? borderColor;
  final String? text;
  final double? height;
  final double? width;
  final bool isDisabled;
  final EdgeInsets? margin;
  final Alignment? alignment;
  final IconData icon;
  final double? borderWidth;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(100),
      child: Container(
      //  height: ScaleSize.height(8.0),
        width: width ?? ScreenUtil().screenWidth,
        decoration: BoxDecoration(
            color: backgroundColor ?? Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(
              color: borderColor ?? Colors.transparent,
            )),
        child: Icon(
          icon,
          color: iconColor ?? Colors.red,
        ),
      ),
    );
  }
}
