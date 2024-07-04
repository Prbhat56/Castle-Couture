import 'package:castle_couture/core/app_export.dart';

class PhoneTextField extends StatelessWidget {
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
  final String? hintText;
  final String? labelText;
  final int? maxLength;
  final TextInputType? keyboardType;
  final String? placeholder;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final String? errorText;
  const PhoneTextField(
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
      this.placeholder,
      this.onChanged,
      this.validator,
      this.errorColor,
      this.errorText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: ScaleSize.height(5.66),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            onChanged: onChanged,
            validator: validator,
            keyboardType: keyboardType,
            maxLength: maxLength,
            controller: controller,
            obscureText: obscureText!,
            maxLines: maxLines ?? 1,
            decoration: InputDecoration(
              floatingLabelBehavior: FloatingLabelBehavior.always,
              focusColor: errorColor ?? CustomColors.liteBlack,
              labelStyle: const TextStyle(color: CustomColors.liteBlack),
              contentPadding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.012,
                horizontal: MediaQuery.of(context).size.width * 0.02,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: errorColor ?? CustomColors.liteBlack,
                ),
              ),
              labelText: labelText,
              counterText: '',
              border: OutlineInputBorder(
                borderSide:
                    BorderSide(color: errorColor ?? CustomColors.liteBlack),
                borderRadius: BorderRadius.circular(4.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1, color: errorColor ?? CustomColors.liteBlack),
              ),
              //  labelText: labelText,
              icon: icon,
              hintText: hintText,
              hintStyle: TextStyle(
                color: errorColor ?? CustomColors.liteBlack,
                fontWeight: FontWeight.w300,
              ),
              prefixIcon: prefixIcon,
              suffixIconColor: errorColor ?? CustomColors.liteBlack,
              prefixIconColor: errorColor ?? CustomColors.liteBlack,
              suffixIcon: suffixIcon,
              // errorText: errorText,
              //  errorStyle: const TextStyle(color: CustomColors.errorColor),
            ),
          ),
          CustomText.spanText(text: errorText, color: CustomColors.errorColor),
        ],
      ),
    );
  }
}
