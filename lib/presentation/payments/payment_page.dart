import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:castle_couture/presentation/d_customer_info/e_date_time/date_time_screen.dart';
import 'package:castle_couture/widgets/custom_appbar/custom_appbar.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Add Payment Details',
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: 'https://sandbox474.estylecentral.com/t9206/updated-pg5-payment-detail.html',
            javascriptMode: JavascriptMode.unrestricted,
            javascriptChannels: <JavascriptChannel>{
              JavascriptChannel(
                name: 'PaymentHandler',
                onMessageReceived: (JavascriptMessage message) {
                  if (message.message == 'FORM_SUBMITTED_SUCCESSFULLY') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const DateTimeScreen()),
                    );
                  }
                },
              ),
            },
            onPageStarted: (url) {
              setState(() {
                _isLoading = true;
              });
            },
            onPageFinished: (url) {
              setState(() {
                _isLoading = false;
              });
            },
          ),
          if (_isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
