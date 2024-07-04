import 'package:flutter/services.dart';
import '../../core/app_export.dart';

class CustomShowDialog {
  static Future<dynamic> buildExitDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomImageView(
                    /* height: size.height * 0.5,
                        width: size.width * 0.5,*/
                      height: 30,
                      width: 30,
                      imagePath: ImageConstant.logo,
                      fit: BoxFit.contain),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    'Confirm Exit..!!!',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Are you sure you,You want to exit',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
          surfaceTintColor: CustomColors.inactiveColor,
          backgroundColor: CustomColors.inactiveColor,
          actionsAlignment: MainAxisAlignment.spaceBetween,
          actions: [
            OutlinedButton(
              onPressed: () async {
                await SystemNavigator.pop();
              },
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                  const Size(40, 30),
                ),
              ),
              child: const Text(
                'Yes',
                style: TextStyle(color: Colors.black),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(42, 31),
                backgroundColor: CustomColors.primaryOrange,
                // Background color
                foregroundColor: Colors.black, // Text color
              ),
              child: const Text(
                'No',
              ),
            )
          ],
        );
      },
    );
  }
  static Future<dynamic> buildLogoutDialog(BuildContext context, void Function()? onPressed) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomImageView(
                    /* height: size.height * 0.5,
                        width: size.width * 0.5,*/
                      height: 30,
                      width: 30,
                      imagePath: ImageConstant.logo,
                      fit: BoxFit.contain),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    'Confirm Logout..!!!',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                'Are you sure you,You want to logout',
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
          surfaceTintColor: CustomColors.inactiveColor,
          backgroundColor: CustomColors.inactiveColor,
          actionsAlignment: MainAxisAlignment.spaceBetween,
          actions: [
            OutlinedButton(
            /*  onPressed: () async {
                await SystemNavigator.pop();
              },*/
              onPressed: onPressed,
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                  const Size(40, 30),
                ),
              ),
              child: const Text(
                'Yes',
                style: TextStyle(color: Colors.black),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },

              style: ElevatedButton.styleFrom(
                minimumSize: const Size(42, 31),
                backgroundColor: CustomColors.primaryOrange,
                // Background color
                foregroundColor: Colors.black, // Text color
              ),
              child: const Text(
                'No',
              ),
            )
          ],
        );
      },
    );
  }
}
