import 'package:castle_couture/core/app_export.dart';

class CheckboxInfo {
  final String text;
  final int value;
  final int? groupValue;
  final void Function(int?)? onChanged;

  CheckboxInfo(
    this.groupValue, {
    required this.text,
    required this.value,
    required this.onChanged,
  });
}

class PackageCard extends StatefulWidget {
  const PackageCard({
    super.key,
    required this.title,
    this.hour,
    required this.subtitle,
    required this.checkboxInfoList,
    this.initiallyExpanded,
    this.onExpansionChanged,
    this.tileKey,
  });

  final String title;
  final String? hour;
  final String subtitle;
  final List<CheckboxInfo> checkboxInfoList;
  final bool? initiallyExpanded;
  final void Function(bool)? onExpansionChanged;
  final Key? tileKey;

  @override
  State<PackageCard> createState() => _PackageCardState();
}

class _PackageCardState extends State<PackageCard> {
  int selectedIndex = -1;
   int? index;

  @override
  Widget build(BuildContext context) {
    // const numberOfCheckboxes = 3;
    return Card(
      surfaceTintColor: Colors.white,
      elevation: 1.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
        side: const BorderSide(
          color: CustomColors.primaryStroke, // Border color
          width: 0.2,
        ),
      ),
      /* Container(
        width: ScaleSize.width(100),
      color: Colors.red,*/
      child: ExpansionTile(
        /*  key: widget.tileKey,
        onExpansionChanged: widget.onExpansionChanged,
        initiallyExpanded: widget.initiallyExpanded ?? true,*/

        key: Key(index.toString()),
        onExpansionChanged: ((newState) {
          if (newState) {
            setState(() {
              const Duration(seconds: 20000);
              selectedIndex = index!;
            });
          } else {
            setState(() {
              selectedIndex = -1;
            });
          }
        }),
        initiallyExpanded: index == selectedIndex,
        expandedAlignment: Alignment.bottomCenter,
        shape: Border.all(color: CustomColors.primaryStroke, width: 0.2),
        tilePadding: EdgeInsets.zero,
        trailing: const SizedBox(),
        title: Column(
          children: [
            Row(
              //  mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomImageView(
                    imagePath: ImageConstant.bride, fit: BoxFit.contain),
                const SizedBox(
                  width: 8.0,
                ),
                Flexible(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CustomText.headline(text: widget.title),
                        const Spacer(),
                        Expanded(
                          child: widget.hour != null
                              ? CustomText.spanText(text: widget.hour)
                              : const SizedBox(),
                        ),
                      ],
                    ),
                    CustomText.bodyText(
                        text: widget.subtitle, textAlign: TextAlign.start),
                  ],
                )),
              ],
            ),
          ],
        ),
        children: [
          const Divider(
            thickness: 0.4,
            color: Colors.grey,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: widget.checkboxInfoList.length,
            itemBuilder: (context, int index) {
              CheckboxInfo checkBoxInfo = widget.checkboxInfoList[index];
              return buildCheckBox(checkBoxInfo);
            },
          ),
        ],
      ),
    );
  }

  Widget buildCheckBox(CheckboxInfo checkboxInfo) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: RadioListTile(
        toggleable: true,
        title: CustomText.subHeadingText(
          text: checkboxInfo.text,
          textAlign: TextAlign.start,
        ),
        contentPadding: EdgeInsets.zero,
        // Remove default padding
        controlAffinity: ListTileControlAffinity.trailing,
        // Align the radio button to the right
        activeColor: CustomColors.primaryOrange,
        dense: true,
        value: checkboxInfo.value,
        groupValue: checkboxInfo.groupValue,
        onChanged: checkboxInfo.onChanged,
      ),
    );
  }
}
