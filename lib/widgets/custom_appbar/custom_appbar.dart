import 'package:castle_couture/core/app_export.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
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
      leadingWidth: 65,
     // titleSpacing: 1.0,
       title: title != null
          ? CustomText.headline(text: title, color: CustomColors.primaryBlack)
          : null,
   /*   title: titleWidget ??
          CustomText.headline(text: title, color: CustomColors.primaryBlack),*/
      centerTitle: centerTitle,
      elevation: elevation ?? 0.4,
      //backgroundColor: Colors.green[50],
      shadowColor: Colors.white,
      actions: actions,
      // backgroundColor: backgroundColor ?? CustomColors.whiteColor,
     /* leading: Padding(
        padding: const EdgeInsets.only(left: 14.0),
        child: leading,
      ),*/
      leading: leading,
    );
  }

  // padding: const EdgeInsets.symmetric(horizontal: 14.0),
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
