import 'package:castle_couture/core/app_export.dart';

class DropdownSelector extends StatelessWidget {
  final Color? color;

  final double? height;
  final double? width;
  final EdgeInsets? margin;
  final String? placeholder;
  final String? dropdownValue;
  final ValueChanged<String?>? onChanged;
  final List<String>? items;
  //final List<DropdownMenuItem<String>>? items;
  final String? Function(String?)? validator;
  final TextEditingController? dropdownController;
  final Color? errorColor;
  final String? hintText;
  const DropdownSelector({
    super.key,
    this.dropdownValue,
    required this.onChanged,
    this.color,
    this.height,
    this.width,
    this.margin,
    this.placeholder,
    this.items,
    this.validator,
    this.dropdownController,
    this.errorColor,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
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
          const SizedBox(height: 5),
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(0.0),
            ),
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: errorColor ?? CustomColors.inactiveColor),
                  borderRadius: const BorderRadius.all(Radius.circular(0.0)),
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 7.0, horizontal: 6.0),
                isDense: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(0.0)),
                  borderSide: BorderSide(
                    color: errorColor ?? CustomColors.primaryOrange,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1,
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
              ),
              hint: dropdownController?.text.isEmpty ?? true
                  ? hintText != null
                      ? Text(
                          hintText!,
                          style: const TextStyle(
                            color: CustomColors.inactiveColor,
                            fontWeight: FontWeight.w300,
                          ),
                        )
                      : null
                  : null,
              menuMaxHeight: size.height * 0.30,
              value: dropdownValue != null &&
                      items?.contains(dropdownValue) == true
                  ? dropdownValue
                  : null,
              items: items?.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: const TextStyle(
                          color: CustomColors.primaryBlack,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  }).toList() ??
                  [],
              onChanged: onChanged,
              icon: const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: CustomColors.liteBlack,
                size: 30,
              ),
              isExpanded: true,
              validator: validator,
            ),
          ),
        ],
      ),
    );
  }
}
