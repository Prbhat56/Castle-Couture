import 'package:castle_couture/core/app_export.dart';
import 'package:castle_couture/widgets/custom_color/custom_colors.dart';

class InactiveButton extends StatelessWidget {
  const InactiveButton({
    super.key,
   
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

    return Container(
        width: width ?? size.width * 0.22,
          height: height ?? size.height * 0.062,

        decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(100), 
          color: backgroundColor ?? AppColors.selectedColor,
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black.withOpacity(0.3), // Shadow color
          //     spreadRadius: 1,
          //     blurRadius: 3,
          //     offset: const Offset(0, 2),
          //   ),
          // ],
        ),
        child: Center(
          child: Row(
                    
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText.buttonText(
                text: "NEXT",
                color: Colors.white
              ),
              const SizedBox(width: 2,),
              CustomImageView(
                height: 20,
                imagePath: ImageConstant.arrow,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ));
  }
}