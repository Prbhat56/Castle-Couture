// import 'package:castle_couture/core/app_export.dart';
// import 'package:castle_couture/presentation/c_appointment_screen/selected_package_screen.dart';
// import 'package:castle_couture/presentation/c_appointment_screen/widgets/package_card.dart';
// import 'package:castle_couture/widgets/custom_buttons/inactive_button.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class AppointmentScreen extends StatefulWidget {
//   const AppointmentScreen({super.key});

//   @override
//   State<AppointmentScreen> createState() => AppointmentScreenState();
// }

// class AppointmentScreenState extends State<AppointmentScreen> {
//   int? selectValue;
//   int? selectValue1;
//   int? selectValue2;
//   int? selectValue3;

//   bool _isButtonEnabled = false;
//   int _expandedCardIndex = -1;

//   @override
//   void initState() {
//     selectValue = null;
//     selectValue1 = null;
//     selectValue2 = null;
//     selectValue3 = null;

//     super.initState();
//   }

//   _updateButtonState() {
//     _isButtonEnabled = selectValue != null ||
//         selectValue1 != null ||
//         selectValue2 != null ||
//         selectValue3 != null;
//   }

//   _selectedRadioButton(int? val, int cardIndex) {
//     setState(() {
//       switch (cardIndex) {
//         case 0:
//           selectValue = val;
//           break;
//         case 1:
//           selectValue1 = val;
//           break;
//         case 2:
//           selectValue2 = val;
//           break;
//         case 3:
//           selectValue3 = val;
//           break;
//       }

//       _updateButtonState();
//     });
//   }

//   void _toggleExpansion(int cardIndex) {
//     setState(() {
//       if (_expandedCardIndex == cardIndex) {
//         _expandedCardIndex = -1;
//       } else {
//         _expandedCardIndex = cardIndex;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       bottomSheet: Container(
//         color: Colors.white,
//         child: Padding(
//             padding:
//                 const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//             child: _isButtonEnabled
//                 ? CustomButton(
//                     onTap: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => const SelectedPackageScreen(),
//                           ));
//                     },
//                     text: 'Next',
//                   )
//                 : const InactiveButton(text: 'Next')),
//       ),
//       appBar: CustomAppBar(
//         title: 'Select an appointment',
//         centerTitle: true,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(Icons.arrow_back),
//         ),
//       ),
//       body: SingleChildScrollView(
//         physics: const AlwaysScrollableScrollPhysics(),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
//           child: Column(
//             children: [
//               PackageCard(
//                   title: 'Bridal package',
//                   subtitle:
//                       'Your first-time bridal appointment will consist of a 90 minute one on one experience in our luxurious boutique with our stylists to help find you the gown of your dreams!',
//               // initiallyExpanded: _expandedCardIndex == 0,
//                   onExpansionChanged: (isExpanded){
//                     _toggleExpansion(0);
//                   },
//                   checkboxInfoList: [
//                     CheckboxInfo(selectValue,
//                         text: 'Bridal appointment', value: 0, onChanged: (val) {
//                       _selectedRadioButton(val, 0);
//                     }),
//                     CheckboxInfo(selectValue,
//                         text: 'Bridal celebration package',
//                         value: 1, onChanged: (val) {
//                       _selectedRadioButton(val, 0);
//                     }),
//                     CheckboxInfo(selectValue,
//                         text: 'Bridal returning appointment',
//                         value: 2, onChanged: (val) {
//                       _selectedRadioButton(val, 0);
//                     }),
//                   ]),
//               const SizedBox(
//                 height: 14,
//               ),
//               PackageCard(
//                   title: 'Evening wear',
//                   //    hour: '(hour)',
//                   subtitle:
//                       'Enjoy a one on one private experience in our luxurious evening wear suite for 90 minutes. Whether you are the mother of, or a guest to an event!',
//               //    initiallyExpanded: _expandedCardIndex == 1,
//                   onExpansionChanged: (isExpanded){
//                     _toggleExpansion(1);
//                   },
//                   checkboxInfoList: [
//                     CheckboxInfo(selectValue1,
//                         text: 'Bridal celebration package',
//                         value: 0, onChanged: (val) {
//                       _selectedRadioButton(val, 1);
//                     }),
//                     CheckboxInfo(selectValue1,
//                         text: 'Bridal returning appointment',
//                         value: 1, onChanged: (val) {
//                       _selectedRadioButton(val, 1);
//                     }),
//                   ]),
//               const SizedBox(
//                 height: 14,
//               ),
//               PackageCard(
//                   title: 'Accessories',
//                   //  hour: '(hour)',
//                   subtitle:
//                       'You found the dream dress and now you want to accessorize! One of our expert stylists will be there to style you.',
//                   checkboxInfoList: [
//                     CheckboxInfo(selectValue2,
//                         text: 'Bridal celebration package',
//                         value: 0, onChanged: (val) {
//                       _selectedRadioButton(val, 2);
//                     }),
//                     CheckboxInfo(selectValue2, text: 'Add more', value: 1,
//                         onChanged: (val) {
//                       _selectedRadioButton(val, 2);
//                     }),
//                     CheckboxInfo(selectValue2, text: 'Add more', value: 2,
//                         onChanged: (val) {
//                       _selectedRadioButton(val, 2);
//                     }),
//                   ]),
//               const SizedBox(
//                 height: 14,
//               ),
//               Padding(
//                 padding: EdgeInsets.only(bottom: 60.r),
//                 child: PackageCard(
//                     title: 'Prom/sweet 16',
//                     // hour: '(hour)',
//                     subtitle:
//                         'Enjoy a one on one experience in our luxurious special occasion showroom! Whether you are shopping for your prom or sweet 16, we have the gown for you!',
//                     checkboxInfoList: [
//                       CheckboxInfo(selectValue3, text: 'Add more', value: 0,
//                           onChanged: (val) {
//                         _selectedRadioButton(val, 3);
//                       }),
//                       CheckboxInfo(selectValue3, text: 'Add more', value: 1,
//                           onChanged: (val) {
//                         _selectedRadioButton(val, 3);
//                       }),
//                     ]),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
