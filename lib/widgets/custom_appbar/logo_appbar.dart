import 'package:castle_couture/core/app_export.dart';

class LogoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LogoAppBar({
    super.key,
    this.leading,
    this.centerTitle,
    this.elevation,
    this.backgroundColor,
    this.title,
    this.actions,
    this.titleWidget,
  });

  final Widget? leading;
  final bool? centerTitle;
  final double? elevation;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final String? title;
  final Widget? titleWidget;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: CustomColors.transparent,
      // disable material3 color in appbar
      // titleSpacing: ScaleSize.width(15.0),
      title: CustomImageView(
        height: 56,
        imagePath: ImageConstant.appbarLogo,
        fit: BoxFit.contain,
      ),
      centerTitle: centerTitle ?? true,
      elevation: elevation ?? 0.1,
      //backgroundColor: Colors.green[50],
      shadowColor: Colors.white,

    );
  }

  // padding: const EdgeInsets.symmetric(horizontal: 14.0),
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
