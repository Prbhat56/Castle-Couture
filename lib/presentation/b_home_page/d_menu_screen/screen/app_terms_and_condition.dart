import 'package:castle_couture/widgets/custom_appbar/custom_appbar.dart';
import 'package:castle_couture/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class AppTermsAndConditionsScreen extends StatelessWidget {
  final List<String> termsOfUse = [
    'Welcome to the Castle Couture mobile application. By using this application, you agree to comply with and be bound by the following terms and conditions:',
    "1. Acceptance of Terms: By accessing or using the Castle Couture mobile application, you agree to be bound by these Terms of Use. If you do not agree with any part of these terms, you may not use the application.",
    "2. Use of Application: The Castle Couture mobile application is intended for personal, non-commercial use. You may not use the application for any illegal or unauthorized purpose.",
    "3. Accuracy of Information: The information provided in the Castle Couture mobile application is for general informational purposes only. We make no representations or warranties of any kind, express or implied, about the completeness, accuracy, reliability, suitability, or availability of the information contained within the application.",
    "4. Liability: Your use of the Castle Couture mobile application is at your own risk. We shall not be liable for any direct, indirect, incidental, consequential, or punitive damages arising out of your access to or use of the application.",
    "5. Intellectual Property: All content included in the Castle Couture mobile application, such as text, graphics, logos, images, audio clips, and software, is the property of Castle Couture or its licensors and is protected by copyright laws.",
    "6. Links to Third-Party Sites: The Castle Couture mobile application may contain links to third-party websites or services that are not owned or controlled by us. We have no control over, and assume no responsibility for, the content, privacy policies, or practices of any third-party websites or services.",
    "7. Acceptance of Payments: By making purchases through the Castle Couture mobile application, you agree to abide by the terms and conditions set forth by the respective credit card providers: Discover, MasterCard, Visa, American Express.",
    "8. Modification of Terms: Castle Couture reserves the right to modify or revise these terms and conditions at any time without prior notice. By continuing to use the Castle Couture mobile application after any such changes, you agree to be bound by the revised terms and conditions.",
  ];

  AppTermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'Terms and Conditions',
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText.headline(text: "Terms and Conditions"),
                const SizedBox(height: 13),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: termsOfUse.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        CustomText.descriptionText(text: termsOfUse[index]),
                        const SizedBox(height: 10.0),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
