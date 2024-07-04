import 'package:castle_couture/core/app_export.dart';
import 'package:castle_couture/presentation/b_home_page/d_menu_screen/screen/app_privacy_policy.dart';
import 'package:castle_couture/presentation/b_home_page/d_menu_screen/screen/app_terms_and_condition.dart';
import 'package:castle_couture/presentation/b_home_page/d_menu_screen/widget/options_widget.dart';
import 'package:castle_couture/presentation/b_home_page/home_page.dart';
import 'package:castle_couture/widgets/app_exit_widget.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          children: [
            ListView.separated(
                shrinkWrap: true,
                itemCount: items.length,
                separatorBuilder: (context, index) => const Divider(
                    color: Colors.grey, height: 5.0, thickness: 0.20),
                itemBuilder: (context, index) {
                  final item = items[index];
                  return ListTile(
                    onTap: () {
                      if (index == 0) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const HomePage(initialPage: 2),
                            ));
                      } else if (index == 1) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  AppTermsAndConditionsScreen(),
                            ));
                      } else if (index == 2) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AppPrivacyPolicyScreen(),
                            ));
                      } else if (index == 3) {
                        CustomShowDialog.buildExitDialog(context);
                        //TODO (uma): It will be used in future
                        //CustomShowDialog.buildLogoutDialog(context, () async {
                        //  Navigator.pushAndRemoveUntil(
                        //      context,
                        //      MaterialPageRoute(
                        //        builder: (context) => const LoginScreen(),
                        //      ),
                        //      (route) => true);
                        //});
                      }
                      //TODO (uma): It will be used in future.

                      // else {
                      //  CustomSnackBar.showCustomSnackBar(
                      //      context, item['title'].toString());
                      //}
                    },
                    contentPadding: EdgeInsets.zero,
                    leading: item['leading'],
                    title: item['title'],
                    trailing: item['trailing'],
                  );
                }),
          ],
        ),
      ),
    );
  }
}
