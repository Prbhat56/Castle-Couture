
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:castle_couture/api_integration/api_service/api_service.dart';
// import 'package:castle_couture/api_integration/data_model/appointment_new_type.dart';
// import 'package:castle_couture/core/app_export.dart';
// import 'package:castle_couture/presentation/c_appointment_screen/widgets/selected_package/selected_package.dart';
// import 'package:castle_couture/presentation/d_customer_info/a_personal_details/cubit/api_cubit.dart';
// import 'package:castle_couture/presentation/d_customer_info/a_personal_details/cubit/form_validation_cubit/personal_detail_form_cubit.dart';
// import 'package:castle_couture/presentation/d_customer_info/a_personal_details/personal_details_screen.dart';

// class NewSelectAppoitmentTypeScreen extends StatefulWidget {
//   final String selectedAppointmentId;
//   final String subtitle;
//   final int bookingItemId;

//   NewSelectAppoitmentTypeScreen({
//     Key? key,
//     required this.selectedAppointmentId,
//     required this.subtitle,
//     required this.bookingItemId
//   }) : super(key: key);

//   @override
//   _NewSelectAppoitmentTypeScreenState createState() => _NewSelectAppoitmentTypeScreenState();
// }

// class _NewSelectAppoitmentTypeScreenState extends State<NewSelectAppoitmentTypeScreen> {
//   List<AppointmentNewType> _appointmentTypes = [];
//   String _selectedAppointmentTypeId = '';  
//   bool isLoading = true;
//     Map<int, List<AppointmentNewType>> appointmentsByBookingItemId = {};

//   @override
//   void initState() {
//     super.initState();
//     _fetchAppointments();
//   }

//   void _fetchAppointments() async {
//     setState(() => isLoading = true);
//     try {
//       List<AppointmentNewType> appointments =
//           await ApiService.fetchAppointmentTypes();

//       appointmentsByBookingItemId.clear();

//       for (var appointment in appointments) {
//         int key = appointment.bookingitemid;
//         appointmentsByBookingItemId.putIfAbsent(key, () => []).add(appointment);
//       }

//       print('Appointments by BookingItemId: $appointmentsByBookingItemId');
//     } catch (e) {
//       print('Error fetching appointments: $e');
//     }
//     setState(() => isLoading = false);
//   }


//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//        bottomSheet: Container(
//         color: Colors.white,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//           child: _selectedAppointmentTypeId.isNotEmpty
//             ? CustomButton(
//         onTap: () {
//              print('Selected Appointment Type ID: $_selectedAppointmentTypeId');
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => MultiBlocProvider(
//                     providers: [
//                       BlocProvider(create: (_) => PersonalDetailFormCubit()),
//                       BlocProvider(create: (_) => PersonalDeatilAPICubit()),
//                     ],
//                     child: const PersonalDetailScreen(),
//                   ),
//                 ),
//               );
//             },
//                 text: 'Next',
//               )
//             : const InactiveButton(text: 'Next'), 
//         ),
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
//       body: isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : buildAppointmentTypesList(),
//     );
//   }
//     Widget buildAppointmentTypesList() {
//        _appointmentTypes = appointmentsByBookingItemId[widget.bookingItemId] ?? [];
//     return SingleChildScrollView(
//       physics: const AlwaysScrollableScrollPhysics(),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
//         child: Column(
//           children: [
//             SelectedPackage(
//               title: widget.selectedAppointmentId,
//               subtitle: widget.subtitle,
//             ),
//             ListView.builder(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               itemCount: _appointmentTypes.length,
//               itemBuilder: (context, index) {
//                 AppointmentNewType appointmentType = _appointmentTypes[index];
//                 return ListTile(
//                   title: Text(appointmentType.description),
//                   trailing: Radio<String>(
//                     value: appointmentType.id,
//                     groupValue: _selectedAppointmentTypeId,
//                     onChanged: (String? value) {
//                       setState(() {
//                         _selectedAppointmentTypeId = value??"";
//                       });
//                     },
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
