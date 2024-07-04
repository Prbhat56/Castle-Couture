/*
import 'package:castle_couture/core/app_export.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    super.key,
    required this.onTap,
    this.color,
    required this.text,
    this.child,
    this.height,
    this.width,
    this.isDisabled = true,
    this.margin,
    this.alignment,
    this.fontSize,
    this.backgroundColor,
  });

  final VoidCallback onTap;
  final Color? color;
  final Color? backgroundColor;
  final String text;
  final Widget? child;
  final double? height;
  final double? width;
  final bool? isDisabled;
  final EdgeInsets? margin;
  final Alignment? alignment;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          alignment: Alignment.center,
          height: height ?? ScaleSize.height(5.66),
          // This is actual height of button according to figma
          width: width ?? ScaleSize.width(100),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: backgroundColor ?? CustomColors.tertiaryGreen,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomImageView(
                height: 40,
                imagePath: ImageConstant.google,
                fit: BoxFit.contain,
                // color: null,
              ),
              CustomText.buttonText(text: text, color: CustomColors.mediumGrey),
            ],
          )),
    );
  }
}
*/
