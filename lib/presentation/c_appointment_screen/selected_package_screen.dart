import 'package:flutter_html/flutter_html.dart';
import 'package:castle_couture/api_integration/api_service/api_service.dart';
import 'package:castle_couture/api_integration/data_model/appointment_data_model.dart';
import 'package:castle_couture/core/app_export.dart';
import 'package:castle_couture/presentation/d_customer_info/a_personal_details/personal_details_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectedPackageScreen extends StatefulWidget {
  final String selectedAppointmentId;
  const SelectedPackageScreen({super.key, required this.selectedAppointmentId});

  @override
  State<SelectedPackageScreen> createState() => _SelectedPackageScreenState();
}

class _SelectedPackageScreenState extends State<SelectedPackageScreen> {
  late Future<NewAppointmentType> _appointmentDetail;
  String _fetchedDescription = '';
  int _fetchedduration = 0;
  bool requirepaymentinforforbooking=false;

  @override
  void initState() {
    super.initState();
    _appointmentDetail = ApiService.fetchAppointmentDetail(
        int.parse(widget.selectedAppointmentId));
  }

  Future<void> _saveAppointmentDetails(String description, duration,bool requirepaymentinfoforbooking) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('appointment_type_description', description);
    await prefs.setInt('appointment_type_duration', duration);
    await prefs.setBool('requirepaymentinfoforbooking',requirepaymentinfoforbooking);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Select an appointment',
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: FutureBuilder<NewAppointmentType>(
        future: _appointmentDetail,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            _fetchedDescription = snapshot.data!.description;
            _fetchedduration = snapshot.data!.duration;
            requirepaymentinforforbooking=snapshot.data!.requirePaymentInfoForBooking;
            double totalmiliseconds=snapshot.data!.duration.toDouble();
            double totalseconds=totalmiliseconds/1000;
            double totalminutes=totalseconds/60;
            double Hours=totalminutes/60;
            double Minutes=totalminutes%60;
   
            int hours = Hours.floor();
            int minutes = Minutes.floor();
            String formattedDuration = '${hours}hour ${minutes}min';
            return SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText.headline(
                      text: snapshot.data!.description,
                    ),
                    const SizedBox(height: 10),
                    Text("Duration: $formattedDuration"),
                    const SizedBox(height: 10),
                    Html(
                      data: snapshot.data!.onlineDescription ??
                          "NO DESCRIPTION RIGHT NOW",
                    ),
                    const SizedBox(height: 20),
                    Stack(
                      children: [
                        Container(
                          color: Colors.transparent,
                          height: size.height * 0.062,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            color: Colors.transparent,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                              ),
                              child: CustomButton(
                                onTap: () async {
                                  if (_fetchedDescription.isNotEmpty) {
                                    await _saveAppointmentDetails(
                                        _fetchedDescription, _fetchedduration,requirepaymentinforforbooking);
                                  }
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const PersonalDetailScreen(),
                                    ),
                                  );
                                },
                                text: 'Next',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(child: Text('No data'));
          }
        },
      ),
    );
  }
}
