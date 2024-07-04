import 'dart:convert';

import 'package:castle_couture/api_integration/api_constant/api_constant.dart';
import 'package:castle_couture/api_integration/data_model/appointment_data_model.dart';
import 'package:castle_couture/api_integration/data_model/available_time_slot_data_model.dart';
import 'package:castle_couture/api_integration/data_model/blackout_data_model.dart';
import 'package:castle_couture/api_integration/data_model/date_available_data_model.dart';
import 'package:castle_couture/api_integration/data_model/how_heard_type_data_model.dart';
import 'package:castle_couture/api_integration/data_model/new_contact_data_model.dart';
import 'package:castle_couture/api_integration/data_model/new_created_appointment_data_model.dart';
import 'package:castle_couture/api_integration/data_model/stylist_data_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  Future<MappedContact> fetchContactDetailById(int contactId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('api_token');

    if (token == null) {
      throw Exception('No token found');
    }

    var url = Uri.parse('${ApiConstants.baseUrl}/api/contacts/$contactId');
    var response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "token": token,
        "Accept": "application/json",
      },
    );

    print(
        "object............${response.statusCode}.........$url..........$token.......$prefs..........$contactId");

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse != null) {
        return MappedContact.fromJson(jsonResponse);
      } else {
        throw Exception('Unexpected response structure');
      }
    } else {
      throw Exception(
          'Failed to fetch contact detail. Status code: ${response.statusCode}. Response: ${response.body}');
    }
  }

  static Future<MappedAppointment> createAppointment(
      {required String firstName,
      required String lastName,
      required String phone,
      required String email,
      required String eventDate,
      required String budget,
      required String numberofpeople,
      required String address1,
      required String address2,
      required String city,
      required String state,
      required String zip,
      required int appointmenttypeid,
      required int howheardid,
      required String selecteddate,
      required bool emailoptin,
      required bool smsoptin,
      required String startDateTime,
      required String endDateTime,
      required int fittingRoomId,
      required String notes,
      required String cardname,
      required String cardnumber,
      required String expire,
      required int phonetype,
      // required String starttime,
      // required String endtime,
      required int duration}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('api_token');
    bool? requirepaymentinforforbooking =
        prefs.getBool('requirepaymentinfoforbooking');

    if (token == null) {
      throw Exception('No token found');
    }

    var url = Uri.parse(
        '${ApiConstants.baseUrl}/api/appointments/scheduleAppointment');
    var response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json;charset=UTF-8",
        "token": token,
      },
      body: jsonEncode({
        "retailerId": "11e00728",
        "firstName": firstName,
        "lastName": lastName,
        "phone": phone,
        "phoneType": phonetype,
        "email": email,
        "eventDateStr": eventDate,
        "budgetStr": budget,
        "numberOfPeople": "10",
        "addressOne": address1,
        "addressTwo": address2,
        "city": city,
        "state": state,
        "zip": zip,
        "appointmentTypeId": appointmenttypeid,
        "howHeardId": howheardid,
        "selectedDate": selecteddate,
        "emailOptIn": emailoptin,
        "smsOptIn": smsoptin,
        "startDateTimeStr": startDateTime,
        "endDateTimeStr": endDateTime,
        // "endTime": endtime,
        // "startTime": starttime,
        "duration": duration,
        "fittingRoomId": fittingRoomId,
        "notes": notes,
        "paymentProfileToken": requirepaymentinforforbooking!
            ? "8e2bac92-8902-4f1b-8848-ece1a9dcf373"
            : null,
        "paymentProfileTokenProvider":
            requirepaymentinforforbooking ? "F" : null,
        "paymentProfileMaskedAcctNumber":
            requirepaymentinforforbooking ? cardnumber : '42424242',
        "paymentProfileExpiration":
            requirepaymentinforforbooking ? expire : null,
        "paymentProfileCardType": requirepaymentinforforbooking ? "visa" : null,
        "paymentProfileBillingName":
            requirepaymentinforforbooking ? cardname : null,
        "paymentProfileAddedBy": requirepaymentinforforbooking ? "M" : null,
      }),
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return MappedAppointment.fromJson(jsonResponse);
    } else {
      throw Exception(
          'Failed to create appointment. Response: ${response.body}');
    }
  }

  static Future<http.Response> createContact(
      {required int typeId,
      required String firstName,
      required String lastName,
      required String emailAddress,
      required String homePhoneNumber,
      required String workPhoneNumber,
      required String mobilePhoneNumber,
      required String address1,
      required String address2,
      required String city}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('api_token');
    if (token == null) {
      throw Exception('No token found');
    }

    var url = Uri.parse('${ApiConstants.baseUrl}/api/contacts');
    var response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "token": token,
        "Accept": "application/json",
      },
      body: jsonEncode({
        "retailerId": ApiConstants.retailerId,
        "status": "A",
        "typeId": typeId,
        "firstName": firstName,
        "lastName": lastName,
        "emailAddress": emailAddress,
        "homePhoneNumber": homePhoneNumber,
        "workPhoneNumber": workPhoneNumber,
        "mobilePhoneNumber": mobilePhoneNumber,
        "address1": address1,
        "address2": address2,
        "city": city,
        // "state": state,
        // "zip": zip,
        // "categoryId": categoryId,
        // "howHeardDescription": howHeardDescription,
      }),
    );

    return response;
  }

  static Future<String> fetchAdditionalDetailsDescription() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('api_token');

    if (token == null) {
      throw Exception('No token found');
    }

    var url = Uri.parse('${ApiConstants.baseUrl}/api/scheduler/init');
    var response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "token": token,
        "Accept": "application/json",
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      print('Response: $jsonResponse');

      Map<String, dynamic>? additionalDetailsStep =
          jsonResponse['steps'].firstWhere(
        (step) => step['id'] == 'additionalDetails',
        orElse: () => null,
      );

      if (additionalDetailsStep != null) {
        String description = additionalDetailsStep['description'] ?? '';

        return description;
      } else {
        throw Exception('AdditionalDetails step not found in the response');
      }
    } else {
      throw Exception(
          'Failed to fetch additional details description. Status code: ${response.statusCode}');
    }
  }

  static Future<List<dynamic>> fetchAppointmentBlocksList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('api_token');

    if (token == null) {
      throw Exception('No token found');
    }

    var url = Uri.parse('${ApiConstants.baseUrl}/api/appointmentBlocks/list');
    var response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "token": token,
        "Accept": "application/json",
      },
      body: jsonEncode({
        "retailerId": "11e00728",
      }),
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse;
    } else {
      print('Response body: ${response.body}');
      throw Exception(
          'Failed to fetch appointment blocks list1. Status code: ${response.statusCode}');
    }
  }

  static Future<NewAppointmentType> fetchAppointmentDetail(
      int appointmentTypeId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('api_token');

    if (token == null) {
      throw Exception('No token found');
    }

    var url = Uri.parse(
        '${ApiConstants.baseUrl}/api/appointmentTypes/$appointmentTypeId');
    var response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "token": token,
        "Accept": "application/json",
      },
    );

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return NewAppointmentType.fromJson(jsonResponse);
    } else {
      throw Exception(
          'Failed to fetch appointment detail.2 Status code: ${response.statusCode}');
    }
  }

  static Future<MappedAppointment> fetchAppointmentDetailById(
      int appointmentId) async {
    String token = await ApiService.generateToken();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('api_token', token);
    var url =
        Uri.parse('${ApiConstants.baseUrl}/api/appointments/$appointmentId');
    var response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "token": token,
        "Accept": "application/json",
      },
    );
    print("test $url........${response.body}");
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return MappedAppointment.fromJson(jsonResponse);
    } else {
      throw Exception(
          'Failed to fetch appointment detail.3 Status code: ${response.statusCode}. Response: ${response.body}');
    }
  }

  static Future<Map<String, dynamic>> fetchAppointmentsList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('api_token');

    if (token == null) {
      throw Exception('No token found');
    }

    var url = Uri.parse('${ApiConstants.baseUrl}/api/appointments/list');
    var response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "token": token,
        "Accept": "application/json",
      },
      body: jsonEncode({
        "retailerId": "11e00728",
        // "typeId": typeId,
      }),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse;
    } else {
      print('Response body: ${response.body}');
      throw Exception(
          'Failed to fetch appointment list. Status code: ${response.statusCode}');
    }
  }

  static Future<List<NewAppointmentType>> fetchAppointmentTypes() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('api_token');

    if (token == null) {
      throw Exception('No token found');
    }

    var url = Uri.parse(
        '${ApiConstants.baseUrl}/api/appointmentTypes/getAllActiveAppointmentTypesWithDetails');
    var response = await http.get(
      url,
      headers: {
        //"Content-Type": "application/json",
        "token": token,
        //"Accept": "application/json",
      },
      //body: jsonEncode({
      //  "retailerId": "11e00728",
      //}),
    );

    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);
      return jsonResponse
          .map((data) => NewAppointmentType.fromJson(data))
          .toList();
    } else {
      print('Response body: ${response.body}');
      throw Exception(
          'Failed to fetch appointment types. Status code: ${response.statusCode}');
    }
  }

  static Future<List<DateAvailable>> fetchAvailableDates(
      int appointmentTypeId, DateTime startDate, DateTime endDate) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('api_token');

    if (token == null) {
      throw Exception('No token found');
    }

    var url = Uri.parse(
        '${ApiConstants.baseUrl}/api/appointments/getAvailableAppointmentsForTimePeriod/$appointmentTypeId/${_formatDate(startDate)}/${_formatDate(endDate)}');
    var response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "token": token,
        "Accept": "application/json",
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse
          .map((data) => DateAvailable.fromJson(data as Map<String, dynamic>))
          .toList();
    } else {
      throw Exception(
          'Failed to fetch available dates. Status code: ${response.statusCode}');
    }
  }

  static Future<List<AvailableTimeSlot>> fetchAvailableTimeSlots(
      String appointmentTypeId, String selectedDate) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('api_token');

    if (token == null) {
      throw Exception('No token found');
    }

    var url = Uri.parse(
        '${ApiConstants.baseUrl}/api/scheduler/getAvailableTime/$appointmentTypeId/$selectedDate');
    var response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "token": token,
        "Accept": "application/json",
      },
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      // Access the "timeSlots" array inside the response JSON
      List<dynamic> timeSlotsJson = jsonResponse['timeSlots'];

      // Map the time slots to AvailableTimeSlot objects
      List<AvailableTimeSlot> timeSlots = timeSlotsJson
          .map((data) =>
              AvailableTimeSlot.fromJson(data as Map<String, dynamic>))
          .toList();

      return timeSlots;
    } else {
      print(
          'Failed to fetch available time slots. Status code: ${response.statusCode}.......$url...........${response.body}');

      throw Exception(
          'Failed to fetch available time slots. Status code: ${response.statusCode}');
    }
  }

  static Future<List<BlackoutDate>> fetchBlackoutDates() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('api_token');

    if (token == null) {
      throw Exception('No token found');
    }

    var url =
        Uri.parse('${ApiConstants.baseUrl}/api/calendarBlackOutDates/list');
    var response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "token": token,
        "Accept": "application/json",
      },
      body: jsonEncode({"retailerId": "11e00728"}),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      // Corrected to use 'result' key based on your JSON response
      if (jsonResponse.containsKey('result')) {
        List<dynamic> blackoutDatesJson = jsonResponse['result'];
        return blackoutDatesJson
            .map((data) => BlackoutDate.fromJson(data as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Result key not found in response.');
      }
    } else {
      throw Exception(
          'Failed to fetch blackout dates. Status code: ${response.statusCode}');
    }
  }

  static Future<String> fetchCreditCardDescription() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('api_token');

    if (token == null) {
      throw Exception('No token found');
    }

    var url = Uri.parse('${ApiConstants.baseUrl}/api/scheduler/init');
    var response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "token": token,
        "Accept": "application/json",
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      // Print the entire response for debugging
      print('Response: $jsonResponse');

      // Find the step with id "requiredFields"
      Map<String, dynamic>? requiredFieldsStep =
          jsonResponse['steps'].firstWhere(
        (step) => step['id'] == 'requiredFields',
        orElse: () => null,
      );

      if (requiredFieldsStep != null) {
        // Extract the description from the "requiredFields" step
        String? description = requiredFieldsStep['description'];
        if (description != null) {
          return description;
        } else {
          throw Exception('Description not found in the "requiredFields" step');
        }
      } else {
        throw Exception('RequiredFields step not found in the response');
      }
    } else {
      throw Exception(
          'Failed to fetch credit card description. Status code: ${response.statusCode}');
    }
  }

  static Future<List<HowHeardType>> fetchHowHeardTypes() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('api_token');

    if (token == null) {
      throw Exception('No token found');
    }

    var url = Uri.parse('${ApiConstants.baseUrl}/api/howHeards/list');
    var response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "token": token,
        "Accept": "application/json",
      },
      body: jsonEncode({
        "retailerId": "11e00728",
      }),
    );

    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((data) => HowHeardType.fromJson(data)).toList();
    } else {
      throw Exception(
          'Failed to fetch how heard types. Status code: ${response.statusCode}');
    }
  }

  static Future<List<Map<String, String>>> fetchStatesList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('api_token');

    if (token == null) {
      throw Exception('No token found');
    }

    var url = Uri.parse('${ApiConstants.baseUrl}/api/scheduler/init');
    var response = await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
        "token": token,
        "Accept": "application/json",
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      // Print the entire response for debugging
      print('Response: $jsonResponse');

      // Find the step with label "requiredFields"
      Map<String, dynamic>? requiredFieldsStep =
          jsonResponse['steps'].firstWhere(
        (step) => step['id'] == 'requiredFields',
        orElse: () => null,
      );

      if (requiredFieldsStep != null) {
        // Find the step with id "state" within "requiredFields"
        Map<String, dynamic>? stateStep =
            requiredFieldsStep['fields'].firstWhere(
          (field) => field['id'] == 'state',
          orElse: () => null,
        );

        if (stateStep != null) {
          List<dynamic> statesData = stateStep['options'];

          List<Map<String, String>> statesList = statesData.map((state) {
            return {
              'label': state['label'].toString(),
              'id': state['id'].toString(),
            };
          }).toList();

          return statesList;
        } else {
          throw Exception('State field not found in the "requiredFields" step');
        }
      } else {
        throw Exception('RequiredFields step not found in the response');
      }
    } else {
      throw Exception(
          'Failed to fetch states list. Status code: ${response.statusCode}');
    }
  }

  static Future<List<int>> fetchStylistIds() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('api_token');

    if (token == null) {
      throw Exception('No token found');
    }

    var url = Uri.parse('${ApiConstants.baseUrl}/api/fittingRooms/list');
    var response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
        "token": token,
        "Accept": "application/json",
      },
      body: jsonEncode({
        "retailerId": "11e00728", // Adjust retailerId if needed
      }),
    );

    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);
      List<int> ids =
          jsonResponse.map((data) => Stylist.fromJson(data).id).toList();
      return ids;
    } else {
      print('Response body: ${response.body}');
      throw Exception(
          'Failed to fetch stylist list. Status code: ${response.statusCode}');
    }
  }

  static Future<String> generateToken() async {
    var url = Uri.parse('${ApiConstants.baseUrl}${ApiConstants.apiLoginPath}');
    var response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "apiKey": "e65081a7c7193336",
          "employeeId": 0,
          "hash": "string",
          "retailerId": ApiConstants.retailerId
        }));

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return jsonResponse['token'];
    } else {
      throw Exception('Failed to generate token');
    }
  }

  static Future<http.Response> updateContact({
    required int contactId,
    required int typeId,
    required String firstName,
    required String lastName,
    required String emailAddress,
    required String homePhoneNumber,
    required String workPhoneNumber,
    required String mobilePhoneNumber,
    required String address1,
    required String address2,
    required String city,
  }) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('api_token');
    if (token == null) {
      throw Exception('No token found');
    }

    var url = Uri.parse('${ApiConstants.baseUrl}/api/contacts/$contactId');
    var response = await http.put(
      url,
      headers: {
        "Content-Type": "application/json",
        "token": token,
        "Accept": "application/json",
      },
      body: jsonEncode({
        "retailerId": ApiConstants.retailerId,
        "status": "A",
        "typeId": typeId,
        "firstName": firstName,
        "lastName": lastName,
        "emailAddress": emailAddress,
        "homePhoneNumber": homePhoneNumber,
        "workPhoneNumber": workPhoneNumber,
        "mobilePhoneNumber": mobilePhoneNumber,
        "address1": address1,
        "address2": address2,
        "city": city,
        // "state": state,
        // "zip": zip,
        // "categoryId": categoryId,
        // "howHeardDescription": howHeardDescription,
      }),
    );

    return response;
  }

  static String _formatDate(DateTime date) {
    return '${date.year}-${_formatNumber(date.month)}-${_formatNumber(date.day)}';
  }

  static String _formatNumber(int number) {
    return number < 10 ? '0$number' : number.toString();
  }
}
