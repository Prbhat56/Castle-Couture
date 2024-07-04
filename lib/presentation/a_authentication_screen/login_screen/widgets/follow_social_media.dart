import 'package:castle_couture/core/app_export.dart';

class FollowSocialMedia extends StatelessWidget {
  const FollowSocialMedia({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.10,
      width: size.width * 0.60,
      child: Column(
        children: [
          CustomText.headline(text: 'Follow us on'),
          const SizedBox(
            height: 10,
          ),
          Row(
            //  mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {},
                child: Column(
                  children: [
                    CustomImageView(
                      height: size.height * 0.022,
                     // width: size.width * 0.05,
                      imagePath: ImageConstant.yt,
                      fit: BoxFit.fill,
                    ),
                    CustomText.captionText(text: 'Youtube'),
                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                child: Column(
                  children: [
                    CustomImageView(
                      height: size.height * 0.022,
                      imagePath: ImageConstant.ig,
                      fit: BoxFit.fill,
                    ),
                    CustomText.captionText(text: 'Instagram'),
                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                child: Column(
                  children: [
                    CustomImageView(
                      height: size.height * 0.022,
                      imagePath: ImageConstant.fb,
                      fit: BoxFit.fill,
                    ),
                    CustomText.captionText(text: 'Facebook' ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
