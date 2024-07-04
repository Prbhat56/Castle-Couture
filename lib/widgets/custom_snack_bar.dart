
import '../core/app_export.dart';

class CustomSnackBar {
  static showCustomSnackBar(BuildContext context, String content) {
    double screenWidth = MediaQuery.of(context).size.width;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(Icons.info, color: Colors.white),
            const SizedBox(width: 12.0),
            Flexible(
              child: Text(
                content,
                style: const TextStyle(fontSize: 16.0),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ],
        ),
        duration: const Duration(seconds: 1),
        backgroundColor: CustomColors.primaryOrange,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16.0),
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth < 600 ? 12.0 : 20.0,
          vertical: screenWidth < 600 ? 8.0 : 12.0,
        ),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            // Handle undo action
          },
        ),
      ),
    );
  }
}
