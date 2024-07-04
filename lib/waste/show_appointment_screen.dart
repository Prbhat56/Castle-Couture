//// import 'package:castle_couture/api_integration/api_service/api_service.dart';
//// import 'package:castle_couture/api_integration/data_model/appointment_data_model.dart';
//// import 'package:castle_couture/core/app_export.dart';
//// import 'package:castle_couture/presentation/c_appointment_screen/selected_package_screen.dart';
//// import 'package:castle_couture/presentation/c_appointment_screen/widgets/package_card.dart';

//// class AppointmentScreen extends StatefulWidget {
////   const AppointmentScreen({Key? key}) : super(key: key);

////   @override
////   State<AppointmentScreen> createState() => _AppointmentScreenState();
//// }

//// class _AppointmentScreenState extends State<AppointmentScreen> {
////    late Future<List<AppointmentType>> futureAppointmentTypes;
////   List<AppointmentType> appointmentTypes = [];
////   int currentIndex = 0;
////   int? selectedValue;
////   bool _isButtonEnabled = false;
////   String? currentlySelectedCard;
////   String? selectedSubtitle;
////   String? selectedAppointmentDescription;

////       final List<Map<String, dynamic>> packageData =[
////       {
////         "title": "Accessories",
////         "subtitle":
////             'Your first-time bridal appointment will consist of a 90 minute one on one experience in our luxurious boutique with our stylists to help find you the gown of your dreams!',
////         "options": ["Accesories Appointment", "BLOCK"],
////       },
////       {
////         "title": "Bridal Package",
////         "subtitle":
////             'Your first-time bridal appointment will consist of a 90 minute one on one experience in our luxurious boutique with our stylists to help find you the gown of your dreams!',
////         "options": [
////           "Bridal Appointment",
////           'Bridal celebration package',
////           'Bridal Crown Room',
////           "Bridal Poppin at 4'0 clock",
////           "Bridal Returning Appointment"
////         ],
////       },
////       {
////         "title": "Crown Room",
////         "subtitle":
////             'You found the dream dress and now you want to accessorize! One of our expert stylists will be there to style you.',
////         "options": [
////           'Bridal celebration package',
////           'Bridal Crown Room',
////           "Bridal Poppin at 4'0 clock"
////         ],
////       },
////       {
////         "title": "Evening Wear",
////         "subtitle":
////             'Enjoy a one on one private experience in our luxurious evening wear suite for 90 minutes. Whether you are the mother of, or a guest to an event!',
////         "options": ['Bridal Crown Room', "Bridal Poppin at 4'0 clock"],
////       },
////       {
////         "title": "Prom",
////         "subtitle":
////             'Enjoy a one on one experience in our luxurious special occasion showroom! Whether you are shopping for your prom or sweet 16, we have the gown for you!',
////         "options": [
////           'Bridal celebration package',
////           'Bridal Crown Room',
////           "Bridal Poppin at 4'0 clock"
////         ],
////       },
////       {
////         "title": "Pickup",
////         "subtitle":
////             'Enjoy a one on one experience in our luxurious special occasion showroom! Whether you are shopping for your prom or sweet 16, we have the gown for you!',
////         "options": [
////           'Bridal celebration package',
////           'Bridal Crown Room',
////           "Bridal Poppin at 4'0 clock"
////         ],
////       },
////     ];
//// Map<String, int> descriptionToIdMap = {};
////   @override
////  void initState() {
////   super.initState();
////  futureAppointmentTypes = ApiService.fetchAppointmentTypes().then((types) {
////   appointmentTypes = types;
////   for (var type in types) {
////     descriptionToIdMap[type.description] = type.id;
////   }

////   return types;
//// });

//// }
//// void _selectedRadioButton(String cardTitle, int? val) {
////   setState(() {
////     if (val != null && val < appointmentTypes.length) {
////       currentlySelectedCard = cardTitle;
////       selectedValue = val;
////       selectedSubtitle = packageData.firstWhere(
////         (package) => package["title"] == cardTitle,
////       )["subtitle"];
////       selectedAppointmentDescription = appointmentTypes[val].description;
////       print("Selected Description: $selectedAppointmentDescription");
////     } else {
////       currentlySelectedCard = null;
////       selectedValue = null;
////       selectedSubtitle = null;
////       selectedAppointmentDescription = null;
////     }
////     _updateButtonState();
////   });
//// }

////   void _updateButtonState() {
////     setState(() {
////       _isButtonEnabled = selectedValue != null;
////     });
////   }

//// void _navigateToNextScreen() {
////   if (selectedAppointmentDescription == null || !descriptionToIdMap.containsKey(selectedAppointmentDescription)) {

////     ScaffoldMessenger.of(context).showSnackBar(
////       SnackBar(content: Text('No matching appointment type found')),
////     );
////     return;
////   }

////   int selectedAppointmentId = descriptionToIdMap[selectedAppointmentDescription]!;

////   if (selectedSubtitle != null) {
////     Navigator.push(
////       context,
////       MaterialPageRoute(
////         builder: (context) => SelectedPackageScreen(
////           selectedAppointmentId: selectedAppointmentId,
////           subtitle: selectedSubtitle!,
////         ),
////       ),
////     );
////   } else {
////     ScaffoldMessenger.of(context).showSnackBar(
////       SnackBar(content: Text('Subtitle is missing')),
////     );
////   }
//// }

////   @override
////   Widget build(BuildContext context) {
////     return Scaffold(
////       bottomSheet: Container(
////         color: Colors.white,
////         child: Padding(
////           padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
////           child: _isButtonEnabled
////               ? CustomButton(
////                   onTap:_navigateToNextScreen,
////                   text: 'Next',
////                 )
////               : const InactiveButton(text: 'Next'),
////         ),
////       ),
////       appBar: CustomAppBar(
////         title: 'Select an Appointment',
////         centerTitle: true,
////         leading: IconButton(
////           onPressed: () => Navigator.pop(context),
////           icon: const Icon(Icons.arrow_back),
////         ),
////       ),
////   body: Column(
////     children: [
////       // YourListView(appointmentTypes: [],),
////       FutureBuilder<List<AppointmentType>>(
////           future: futureAppointmentTypes,
////           builder: (context, snapshot) {
////             if (snapshot.connectionState == ConnectionState.waiting) {
////               return Center(child: CircularProgressIndicator());
////             } else if (snapshot.hasError) {
////               return Center(child: Text("Error: ${snapshot.error}"));
////             } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
////               // Ensure data is not null and not empty
////               appointmentTypes = snapshot.data!;
////               return Padding(
////                 padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
////                 child: ListView(
////                   children: _buildPackageCards(),
////                 ),
////               );
////             } else {
////               return Center(child: Text("No appointment types found"));
////             }
////           },
////         ),
////     ],
////   ),

////       // Padding(
////       //   padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
////       //   child: ListView( // Wrap the list of cards in a ListView
////       //     children: _buildPackageCards(),
////       //   ),
////       // ),
////     );
////   }

////   List<Widget> _buildPackageCards() {
////        currentIndex = 0;

////      return packageData.map((data) {
////       List<String> options = [];
////       int optionsCount = data["options"].length;

////       for (int i = 0; i < optionsCount && currentIndex < appointmentTypes.length; i++, currentIndex++) {

////         options.add(appointmentTypes[currentIndex].description);
////       }

////       return PackageCard(
////         title: data["title"] as String,
////         subtitle: data["subtitle"] as String,
////  groupValue: currentlySelectedCard == data["title"] ? selectedValue : null,
////         checkboxInfoList: List.generate(options.length, (index) {
////           return CheckboxInfo(
////             text: options[index],
////             value: index,
////           );
////         }),
////        onRadioChanged: (int? newValue) {

////     _selectedRadioButton(appointmentTypes as String, newValue);

////   },
////       );
////     }).toList();
////   }
//// }

//// import 'package:castle_couture/api_integration/api_service/api_service.dart';
//// import 'package:castle_couture/api_integration/data_model/appointment_new_type.dart';
//// import 'package:castle_couture/core/utils/image_constant.dart';
//// import 'package:castle_couture/presentation/c_appointment_screen/selected_package_screen.dart';
//// import 'package:castle_couture/widgets/custom_appbar/custom_appbar.dart';
//// import 'package:castle_couture/widgets/custom_buttons/custom_button.dart';
//// import 'package:castle_couture/widgets/custom_buttons/inactive_button.dart';
//// import 'package:castle_couture/widgets/custom_image_view.dart';
//// import 'package:flutter/material.dart';

//// class AppoitmentScreen extends StatefulWidget {
////   @override
////   _AppointmentScreenState createState() => _AppointmentScreenState();
//// }

//// class _AppointmentScreenState extends State<AppoitmentScreen> {
////   String? selectedAppointmentId; // Variable to hold the selected ID
////   bool _isButtonEnabled =
////       false; // Variable to control button enable/disable state

////   // Variable to hold the subtitle of selected expansion tile
////   String? selectedSubtitle;

////   // Dummy titles and subtitles with required number of descriptions
////   final List<Map<String, dynamic>> titlesAndSubtitles = [
////     {
////       "title": "Accessories",
////       "subtitle":
////           'Your first-time bridal appointment will consist of a 90 minute one on one experience in our luxurious boutique with our stylists to help find you the gown of your dreams!',
////       "count": 2
////     },
////     {
////       "title": "Bridal Package",
////       "subtitle":
////           'Your first-time bridal appointment will consist of a 90 minute one on one experience in our luxurious boutique with our stylists to help find you the gown of your dreams!',
////       "count": 5
////     },
////     {
////       "title": "Crown Room",
////       "subtitle":
////           'Enjoy a one on one private experience in our luxurious evening wear suite for 90 minutes. Whether you are the mother of, or a guest to an event!',
////       "count": 3
////     },
////     {
////       "title": "Evening Wear",
////       "subtitle":
////           'Enjoy a one on one experience in our luxurious special occasion showroom! Whether you are shopping for your prom or sweet 16, we have the gown for you!',
////       "count": 2
////     },
////     {"title": "Prom", "subtitle": "Variety of options", "count": 3},
////     {
////       "title": "Pickup",
////       "subtitle":
////           'Enjoy a one on one experience in our luxurious special occasion showroom! Whether you are shopping for your prom or sweet 16, we have the gown for you!',
////       "count": 3
////     },
////   ];

////   @override
////   Widget build(BuildContext context) {
////         Size size = MediaQuery.of(context).size;
////     return Scaffold(
////       appBar: CustomAppBar(
////         title: 'Select an Appointment',
////         centerTitle: true,
////         leading: IconButton(
////           onPressed: () => Navigator.pop(context),
////           icon: const Icon(Icons.arrow_back),
////         ),
////       ),
////       body: FutureBuilder<List<AppointmentNewType>>(
////         future: ApiService.fetchAppointmentTypes(),
////         builder: (context, snapshot) {
////           if (snapshot.connectionState == ConnectionState.waiting) {
////             return Center(child: CircularProgressIndicator()); // Show loading indicator
////           } else if (snapshot.hasError) {
////             return Text('Error: ${snapshot.error}');
////           } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
////             return Text('No appointments found');
////           } else {
////             List<AppointmentNewType> appointments = snapshot.data!;
////             int startIndex = 0;

////             return ListView.builder(
////               itemCount: titlesAndSubtitles.length,
////               itemBuilder: (context, index) {
////                 var titleAndSubtitle = titlesAndSubtitles[index];
////                 int count =
////                     titleAndSubtitle["count"] ?? 0; // Default to 0 if null
////                 int endIndex = startIndex + count;
////                 endIndex = endIndex > appointments.length
////                     ? appointments.length
////                     : endIndex;
////                 List<AppointmentNewType> appointmentsForTile =
////                     appointments.sublist(startIndex, endIndex);

////                 startIndex = endIndex;

////                 return Card(
////                   child: Column(
////                     crossAxisAlignment: CrossAxisAlignment.start,
////                     children: [
////                       ListTile(
////                         title: Text(
////                           titleAndSubtitle["title"],
////                           style: TextStyle(fontWeight: FontWeight.bold),
////                         ),
////                         subtitle: Text(titleAndSubtitle["subtitle"]),
////                         leading: CustomImageView(
////                     imagePath: ImageConstant.bride,
////                     fit: BoxFit.contain,
////                     height: size.height * 0.06,
////                   ),
////                       ),
////                       Column(
////                         children: appointmentsForTile.map((appointment) {
////                           return RadioListTile<String>(
////                             title: Text(appointment.description),
////                             value: appointment.id,
////                             groupValue: selectedAppointmentId,
////                             onChanged: (String? value) {
////                               setState(() {
////                                 selectedAppointmentId = value;
////                                 selectedSubtitle = titleAndSubtitle["subtitle"];
////                                 _isButtonEnabled = true;
////                               });
////                             },
////                           );
////                         }).toList(),
////                       ),
////                     ],
////                   ),
////                 );
////               },
////             );
////           }
////         },
////       ),
////       bottomNavigationBar: Padding(
////         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
////         child: _isButtonEnabled
////             ? CustomButton(
////                 onTap: () {
////                   if (selectedSubtitle != null &&
////                       selectedAppointmentId != null) {
////                     Navigator.push(
////                       context,
////                       MaterialPageRoute(
////                         builder: (context) => SelectedPackageScreen(
////                           selectedAppointmentId: selectedAppointmentId!,
////                           subtitle: selectedSubtitle!,
////                         ),
////                       ),
////                     );
////                   }
////                 },
////                 text: 'Next',
////               )
////             : const InactiveButton(text: 'Next'),
////       ),
////     );
////   }
//// }











//import 'package:castle_couture/api_integration/api_service/api_service.dart';
//import 'package:castle_couture/api_integration/data_model/appointment_new_type.dart';
//import 'package:castle_couture/core/utils/image_constant.dart';
//import 'package:castle_couture/presentation/c_appointment_screen/selected_package_screen.dart';
//import 'package:castle_couture/widgets/custom_appbar/custom_appbar.dart';
//import 'package:castle_couture/widgets/custom_buttons/custom_button.dart';
//import 'package:castle_couture/widgets/custom_buttons/inactive_button.dart';
//import 'package:castle_couture/widgets/custom_image_view.dart';
//import 'package:flutter/material.dart';

//class AppoitmentScreen extends StatefulWidget {
//  @override
//  _AppointmentScreenState createState() => _AppointmentScreenState();
//}

//class _AppointmentScreenState extends State<AppoitmentScreen> {

//  String? selectedAppointmentId; // Variable to hold the selected ID
//  bool _isButtonEnabled =
//      false; // Variable to control button enable/disable state

//  // Variable to hold the subtitle of selected expansion tile
//  String? selectedSubtitle;
//    bool _isLoading = false;

//  // Dummy titles and subtitles with required number of descriptions
//  final List<Map<String, dynamic>> titlesAndSubtitles = [
//    {
//      "title": "Accessories",
//      "subtitle":
//          'Your first-time bridal appointment will consist of a 90 minute one on one experience in our luxurious boutique with our stylists to help find you the gown of your dreams!',
//      "count": 2
//    },
//    {
//      "title": "Bridal Package",
//      "subtitle":
//          'Your first-time bridal appointment will consist of a 90 minute one on one experience in our luxurious boutique with our stylists to help find you the gown of your dreams!',
//      "count": 5
//    },
//    {
//      "title": "Crown Room",
//      "subtitle":
//          'Enjoy a one on one private experience in our luxurious evening wear suite for 90 minutes. Whether you are the mother of, or a guest to an event!',
//      "count": 3
//    },
//    {
//      "title": "Evening Wear",
//      "subtitle":
//          'Enjoy a one on one experience in our luxurious special occasion showroom! Whether you are shopping for your prom or sweet 16, we have the gown for you!',
//      "count": 2
//    },
//    {"title": "Prom", "subtitle": "Variety of options", "count": 3},
//    {
//      "title": "Pickup",
//      "subtitle":
//          'Enjoy a one on one experience in our luxurious special occasion showroom! Whether you are shopping for your prom or sweet 16, we have the gown for you!',
//      "count": 3
//    },
//  ];

//  @override
//  Widget build(BuildContext context) {
//            Size size = MediaQuery.of(context).size;
//    return Scaffold(
//      appBar: CustomAppBar(
//        title: 'Select an Appointment',
//        centerTitle: true,
//        leading: IconButton(
//          onPressed: () => Navigator.pop(context),
//          icon: const Icon(Icons.arrow_back),
//        ),
//      ),
//      body: FutureBuilder<List<AppointmentNewType>>(
//        future: ApiService.fetchAppointmentTypes(),
//        builder: (context, snapshot) {
//          if (snapshot.connectionState == ConnectionState.waiting) {
//            return Center(child: CircularProgressIndicator());
//          } else if (snapshot.hasError) {
//            return Text('Error: ${snapshot.error}');
//          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//            return Text('No appointments found');
//          } else {
//            List<AppointmentNewType> appointments = snapshot.data!;
//            int startIndex = 0;

//            return ListView.builder(
//              itemCount: titlesAndSubtitles.length,
//              itemBuilder: (context, index) {
//                var titleAndSubtitle = titlesAndSubtitles[index];
//                int count =
//                    titleAndSubtitle["count"] ?? 0; // Default to 0 if null
//                int endIndex = startIndex + count;
//                endIndex = endIndex > appointments.length
//                    ? appointments.length
//                    : endIndex;
//                List<AppointmentNewType> appointmentsForTile =
//                    appointments.sublist(startIndex, endIndex);

//                startIndex = endIndex;

//                return ExpansionTile(
//                  leading: 
//                                           CustomImageView(
//                    imagePath: ImageConstant.bride,
//                    fit: BoxFit.contain,
//                    height: size.height * 0.06,
//                  ),
        
//                  title: Text(titleAndSubtitle["title"]),
//                  subtitle: Text(titleAndSubtitle["subtitle"]),
            
//                  children: appointmentsForTile.map((appointment) {
//                    return ListTile(
//                      title: Text(appointment.description),
//                      trailing: Radio<String>(
//                        value: appointment.id,
//                        groupValue: selectedAppointmentId,
//                        onChanged: (String? value) {
//                          setState(() {
//                            selectedAppointmentId = value;
//                            selectedSubtitle = titleAndSubtitle["subtitle"];
//                            _isButtonEnabled = true;
//                          });
//                        },
//                      ),
//                    );
//                  }).toList(),
//                );
//              },
//            );
//          }
//        },
//      ),
//      bottomNavigationBar: Padding(
//        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//        child: _isButtonEnabled
//            ? CustomButton(
//                onTap: () {
//                  if (selectedSubtitle != null &&
//                      selectedAppointmentId != null) {
//                    Navigator.push(
//                      context,
//                      MaterialPageRoute(
//                        builder: (context) => SelectedPackageScreen(
//                          selectedAppointmentId: selectedAppointmentId!,
//                          subtitle: selectedSubtitle!,
//                        ),
//                      ),
//                    );
//                  }
//                },
//                text: 'Next',
//              )
//            : const InactiveButton(text: 'Next'),
//      ),
//    );
//  }
//}
