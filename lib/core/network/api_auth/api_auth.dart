import 'dart:convert';
import 'dart:math';
import 'package:castle_couture/core/network/api_auth/api_url.dart';
import 'package:http/http.dart' as http;
import 'api_exception.dart';

class ApiAuth {
  Map<String, String> verificationCodes = {};

  Future<Map<String, dynamic>> _handleResponse(http.Response response) async {
    final Map<String, dynamic> data = json.decode(response.body);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return data;
    } else {
      throw ApiException(data['message'] ?? 'An error occurred');
    }
  }

  Future<Map<String, dynamic>> login(String username, String password) async {
    const String url = ApiUrls.login;

    final Map<String, String> body = {
      'username': username,
      'password': password,
    };

    final http.Response response = await http.post(
      Uri.parse(url),
      body: body,
    );

    return _handleResponse(response);
  }

  Future<Map<String, dynamic>> signUp(
      String username, String email, String password) async {
    const String url = ApiUrls.signUp;

    final Map<String, String> body = {
      'username': username,
      'email': email,
      'password': password,
    };

    final http.Response response = await http.post(
      Uri.parse(url),
      body: body,
    );

    return _handleResponse(response);
  }

// Otp verification function

  Future<void> sendOtp(String phoneNumber) async {
    // Simulate sending OTP via SMS (you can replace this with your own logic)
    final String otp = _generateOtp();
    verificationCodes[phoneNumber] = otp;

    // Simulate delay for SMS delivery
    await Future.delayed(const Duration(seconds: 2));

    print('OTP Sent to $phoneNumber: $otp');
  }

  Future<void> verifyOtp(String phoneNumber, String enteredOtp) async {
    final storedOtp = verificationCodes[phoneNumber];

    if (storedOtp == null || enteredOtp != storedOtp) {
      throw ApiException('Invalid OTP. Please try again.');
    }

    // Clear the verification code after successful verification
    verificationCodes.remove(phoneNumber);

    print('OTP Verified for $phoneNumber');
  }

  String _generateOtp() {
    // Simulate generating a 6-digit OTP
    final int otp = (100000 + Random().nextInt(900000));
    return otp.toString();
  }
}
