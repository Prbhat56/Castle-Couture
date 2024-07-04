import 'package:castle_couture/widgets/custom_appbar/custom_appbar.dart';
import 'package:castle_couture/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class AppPrivacyPolicyScreen extends StatelessWidget {
  final Map<dynamic, dynamic> privacyPolicyData = {
    'Privacy Policy':
        'We value your privacy and strive to maintain your trust. This Privacy Policy outlines how Castle Couture collects and uses information when you interact with our mobile applications.',
    'Information Collection':
        'Information You Provide: We collect information you enter or provide to us, such as when creating an account, placing orders, signing up for emails, or requesting appointments.',
    'Use of Information':
        'Contact Information: We use your contact information (email, phone, and address) to manage your account, send you information about products and promotions, process orders, and provide customer support.',
    'Sharing of Information':
        'We may share customer information with trusted partners to enhance your shopping experience and provide services.',
    'Advertising and Analytics':
        'We allow other companies to provide analytics services and serve advertisements on our behalf using technologies like cookies and device identifiers.',
    'Your Choices':
        'You can choose not to provide information, manage your online account, and opt-out of marketing emails.',
    'International':
        'Information may be transferred to and accessed from the United States and other countries. We take steps to protect your information as required by law.',
    'Contact':
        'If you have concerns about our privacy practices, please contact us at info@castlecouturenj.com.',
  };

  AppPrivacyPolicyScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Privacy Policy',
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: privacyPolicyData.entries.map((val) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12.0),
                    CustomText.headline(text: val.key),
                    const SizedBox(height: 10.0),
                    CustomText.descriptionText(text: val.value),
                  ],
                ),
              );
            }).toList()),
      ),
    );
  }
}
