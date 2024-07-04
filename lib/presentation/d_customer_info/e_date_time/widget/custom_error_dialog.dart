import '../../../../core/app_export.dart';

class CustomErrorDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onPressed;

  const CustomErrorDialog({
    required this.title,
    required this.content,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        TextButton(
          onPressed: onPressed,
          child: const Text("OK"),
        ),
      ],
    );
  }
}
