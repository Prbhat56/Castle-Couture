import 'package:castle_couture/core/app_export.dart';

class CustomProgressBar extends StatelessWidget {
  const CustomProgressBar({
    super.key,
    this.text,
    this.child,
    this.height,
    this.width,
    this.margin,
    this.alignment,
    this.fontSize,
    this.iconColor,
    this.backgroundColor,
    this.textColor,
  });

  final Color? iconColor;
  final Color? backgroundColor;
  final Color? textColor;
  final String? text;
  final Widget? child;
  final double? height;
  final double? width;
  final EdgeInsets? margin;
  final Alignment? alignment;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: width,
      height: height ?? size.height * 0.056,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        //borderRadius: BorderRadius.circular(4.0),
        color: backgroundColor ?? CustomColors.primaryBlack,
      ),
      child: child ??
          CustomText.buttonText(
            text: text,
          ),
    );
  }
}
