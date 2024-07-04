import 'package:castle_couture/core/app_export.dart';

class CustomTextBtn extends StatelessWidget {
  const CustomTextBtn({
    super.key,
    this.onTap,
    required this.text,
    this.child,
    this.height,
    this.width,
    this.isDisabled = true,
    this.margin,
    this.alignment,
    this.fontSize,
    this.iconColor,
    this.backgroundColor,
    this.textColor,
    this.textDecoration,
  });

  final VoidCallback? onTap;
  final Color? iconColor;
  final Color? backgroundColor;
  final Color? textColor;
  final String text;
  final Widget? child;
  final double? height;
  final double? width;
  final bool? isDisabled;
  final EdgeInsets? margin;
  final Alignment? alignment;
  final double? fontSize;
  final TextDecoration? textDecoration;

  @override
  Widget build(BuildContext context) {
    //********** We major the height width of mediaQuery in percentage ******//

    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: alignment ?? Alignment.center,
        // height: height ?? ScaleSize.height(5.66),
        // This is actual height of button according to figma
        // width: width ?? ScaleSize.width(17),
        /*  decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            color: backgroundColor ?? CustomColors.buttonGreen,
          ),*/
        child: CustomText.contentText(
            text: text, textDecoration: textDecoration ?? TextDecoration.none),
      ),
    );
  }
}
