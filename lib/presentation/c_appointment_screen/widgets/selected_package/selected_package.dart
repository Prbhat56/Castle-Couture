import 'package:castle_couture/core/app_export.dart';

class SelectedPackage extends StatelessWidget {
  const SelectedPackage({
    super.key,
    required this.title,
    this.hour,
    required this.subtitle,
    this.children = const [],
  });

  final String title;
  final String? hour;
  final String subtitle;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      child: Column(
        children: [
          Card(
            surfaceTintColor: Colors.white,
            elevation: 1.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
              side: const BorderSide(
                color: CustomColors.primaryStroke, // Border color
                width: 0.2,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.bride,
                    fit: BoxFit.contain,
                    height: size.height * 0.06,
                  ),
                  const SizedBox(width: 8.0), // Add spacing between the image and text
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText.subHeadingText(text: title, softWrap: true),
                        const SizedBox(height: 4.0), // Add spacing between title and hour
                        CustomText.spanText(text: hour),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.2),
            child: ExpansionTile(
              expandedAlignment: Alignment.bottomCenter,
              tilePadding: EdgeInsets.zero,
              shape: const RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.zero,
              ),
              trailing: const SizedBox(),
              title: CustomText.bodyText(
                text: subtitle,
                textAlign: TextAlign.start,
              ),
              children: children,
            ),
          ),
        ],
      ),
    );
  }
}


