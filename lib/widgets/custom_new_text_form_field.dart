import 'package:castle_couture/core/app_export.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewCustomTextFormField extends StatelessWidget {
  const NewCustomTextFormField(
      {super.key,
      this.onPressed,
      this.color,
      this.text,
      this.child,
      this.height,
      this.width,
      this.obscureText = false,
      this.margin,
      this.alignment,
      this.controller,
      this.icon,
      this.prefixIcon,
      this.suffixIcon,
      this.maxLines,
      this.hintText,
      this.labelText,
      this.maxLength,
      this.keyboardType,

      this.errorColor,
      this.errorText,
      this.widget,
      this.onChanged,
      this.contentPadding,
      this.readOnly,
      this.validator,
      this.minLines, this.onTap});

  final VoidCallback? onPressed;
  final Color? color;
  final Color? errorColor;
  final String? text;
  final Widget? child;
  final double? height;
  final double? width;
  final bool? obscureText;
  final EdgeInsets? margin;
  final Alignment? alignment;
  final TextEditingController? controller;
  final Widget? icon;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLines;
  final int? minLines;
  final String? hintText;
  final String? labelText;
  final int? maxLength;
  final TextInputType? keyboardType;

  final String? errorText;
  final Widget? widget;
  final bool? readOnly;
  final EdgeInsets? contentPadding;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {


    return   SizedBox(
            height: height,
            child: TextFormField(
              onTap: onTap,
              onTapOutside: (event) {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              readOnly: readOnly ?? false,
              keyboardType: keyboardType,
              maxLength: maxLength ?? 30,
              controller: controller,
              obscureText: obscureText!,
              maxLines: maxLines ?? 1,
              minLines: minLines,
              style: const TextStyle(height: 1.1),
              decoration: InputDecoration(
                fillColor: Colors.transparent,
                focusColor: errorColor ?? CustomColors.inactiveColor,
                labelStyle: const TextStyle(color: CustomColors.inactiveColor),
                contentPadding: contentPadding ??
                    // const EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),

                    EdgeInsets.all(8.5.r),
                isDense: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(0.0)),
                  borderSide: BorderSide(
                    color: errorColor ?? CustomColors.inactiveColor,
                  ),
                ),
                counterText: '',
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: errorColor ?? CustomColors.inactiveColor),
                  borderRadius: const BorderRadius.all(Radius.circular(0.0)),
                ),
                errorStyle: const TextStyle(height: 0.0, fontSize: 10.0),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: CustomColors.errorColor,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(0.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1,
                      color: errorColor ?? CustomColors.inactiveColor),
                  borderRadius: const BorderRadius.all(Radius.circular(0.0)),
                ),
                hintText: hintText,
                hintStyle: TextStyle(
                  color: errorColor ?? CustomColors.inactiveColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                /*  Container(
                  padding: const EdgeInsets.all(2.0),
                  color: Colors.cyan,
                  constraints: const BoxConstraints(
                    maxHeight: 7.0,
                    maxWidth: 7.0,
                  ),
                  child: suffixIcon,
                ),*/
                suffixIconColor: errorColor ?? CustomColors.inactiveColor,
                prefixIconColor: errorColor ?? CustomColors.inactiveColor,
              ),
              onChanged: onChanged,
              validator: validator,
            ),
          );
  }
}
