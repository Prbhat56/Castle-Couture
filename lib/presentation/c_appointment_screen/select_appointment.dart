// import 'package:castle_couture/core/app_export.dart';
// import 'package:castle_couture/presentation/c_appointment_screen/widgets/package_card.dart';
// import 'package:castle_couture/widgets/custom_appbar/custom_appbar.dart';

// class AppointmentScreen extends StatelessWidget {
//   const AppointmentScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomSheet: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//         child: CustomButton(onTap: () {  }, text: 'Next',),
//       ),
//       appBar: CustomAppBar(
//         title: 'Select an appointment',
//         centerTitle: true,
//         leading: IconButton(
//           onPressed: () {},
//           icon: const Icon(Icons.arrow_back),
//         ),
//       ),
//       body: SingleChildScrollView(
//         physics: const AlwaysScrollableScrollPhysics(),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
//           child: Column(
//             // mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               PackageCard(
//                   title: 'Bridal package',
//                   hour: '(hour)',
//                   subtitle:
//                       'Your first-time bridal appointment will consist of a 90 minute one on one experience in our luxurious boutique with our stylists to help find you the gown of your dreams!',
//                   checkboxInfoList: [
//                     CheckboxInfo(
//                         text: 'Bridal appointment', value: 0, onTap: () {}),
//                     CheckboxInfo(
//                         text: 'Bridal celebration package',
//                         value: 0,
//                         onTap: () {}),
//                     CheckboxInfo(
//                         text: 'Bridal returning appointment',
//                         value: 0,
//                         onTap: () {}),
//                   ]),
//               const SizedBox(
//                 height: 14,
//               ),
//               PackageCard(
//                   title: 'Evening wear',
//                   hour: '(hour)',
//                   subtitle:
//                       'Enjoy a one on one private experience in our luxurious evening wear suite for 90 minutes. Whether you are the mother of, or a guest to an event!',
//                   checkboxInfoList: [
//                     CheckboxInfo(text: 'Add more', value: 0, onTap: () {}),
//                   ]),
//               const SizedBox(
//                 height: 14,
//               ),
//               PackageCard(
//                   title: 'Evening wear',
//                   hour: '(hour)',
//                   subtitle:
//                       'Enjoy a one on one private experience in our luxurious evening wear suite for 90 minutes. Whether you are the mother of, or a guest to an event!',
//                   checkboxInfoList: [
//                     CheckboxInfo(text: 'Add more', value: 0, onTap: () {}),
//                   ]),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
