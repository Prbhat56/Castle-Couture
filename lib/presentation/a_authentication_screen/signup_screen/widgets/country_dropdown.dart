import 'package:castle_couture/core/app_export.dart';

class CountryDropdown extends StatelessWidget {
  const CountryDropdown(
      {super.key,
        required this.dropdownValue,
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
        this.placeholder});

  final VoidCallback? onPressed;
  final Color? color;
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
  final String dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: height ?? ScaleSize.height(9.66),
      width: width ?? ScaleSize.width(100),
      decoration: BoxDecoration(
        color: color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CustomText.spanText(
                text: placeholder,
                color: CustomColors.liteBlack,
              ),
              CustomText.spanText(
                text: '*',
                color: CustomColors.errorColor,
              ),
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          Container(
            height: height ?? ScaleSize.height(5.66),
            padding: const EdgeInsets.symmetric(horizontal: 7.0),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              border: Border.all(
                color: CustomColors.inactiveColor,
                width: 1.0,
              ),
              color: color,
              borderRadius: BorderRadius.circular(0.0),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: dropdownValue,
                items: <String>[
                  'Select country',
                  'United State',
                  'Alaska',
                  'Russia',
                  'Florida'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: const TextStyle(
                        color: CustomColors.liteBlack,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {},
                icon: const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: CustomColors.liteBlack,
                  size: 30,
                ),
                isExpanded: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
