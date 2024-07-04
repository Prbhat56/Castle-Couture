import 'package:castle_couture/core/app_export.dart';

class NewCustomButton extends StatelessWidget {
  const NewCustomButton({
    super.key,
    required this.onTap,
    this.text,
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
  });

  final VoidCallback onTap;
  final Color? iconColor;
  final Color? backgroundColor;
  final Color? textColor;
  final String? text;
  final Widget? child;
  final double? height;
  final double? width;
  final bool? isDisabled;
  final EdgeInsets? margin;
  final Alignment? alignment;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Material(
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: width,
          height: height ?? size.height * 0.056,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: backgroundColor ?? CustomColors.primaryBlack,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3), // Shadow color
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: child ??
              CustomText.buttonText(
                text: text,
              ),
        ),
      ),
    );
  }
}