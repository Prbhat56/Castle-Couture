import 'package:castle_couture/api_integration/api_service/api_service.dart';
import 'package:castle_couture/api_integration/data_model/appointment_data_model.dart';
import 'package:castle_couture/core/app_export.dart';
import 'package:castle_couture/presentation/c_appointment_screen/selected_package_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewAppointmentScreen extends StatefulWidget {
  const NewAppointmentScreen({super.key});

  @override
  _NewAppointmentScreenState createState() => _NewAppointmentScreenState();
}

class _NewAppointmentScreenState extends State<NewAppointmentScreen> {
  bool _isLoading = false;
  List<NewAppointmentType> appointmentTypes = [];
  String? selectedAppointmentId;
  int? selectedContainerIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: LogoAppBar(),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                CustomText.headline(
                  text: "Select an Appointment",
                  color: CustomColors.primaryBlack,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    itemCount: appointmentTypes.length,
                    itemBuilder: (context, index) {
                      var appointment = appointmentTypes[index];
                      bool isSelected =
                          selectedAppointmentId == appointment.id.toString();

                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 8),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedAppointmentId = appointment.id.toString();
                              isSelected = !isSelected;
                            });
                            _onAppointmentSelected(selectedAppointmentId!);
                          },
                          onTapDown: (details) {
                            setState(() {
                              selectedContainerIndex = index;
                            });
                          },
                          onTapUp: (details) {
                            setState(() {
                              selectedContainerIndex = null;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                    color: selectedContainerIndex == index
                                        ? Colors.blue
                                        : CustomColors.primaryOrange),
                                color: isSelected
                                    ? CustomColors.primaryOrange
                                    : Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                appointment.description,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: isSelected
                                        ? Colors.white
                                        : CustomColors.primaryBlack,
                                    fontWeight: isSelected
                                        ? FontWeight.bold
                                        : FontWeight.normal),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }

  @override
  void initState() {
    super.initState();
    _fetchAppointments();
  }

  void _fetchAppointments() async {
    if (!mounted) return; // Check if the widget is still mounted
    setState(() => _isLoading = true);
    try {
      String token = await ApiService.generateToken();
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('api_token', token);
      List<NewAppointmentType> allAppointmentTypes =
          await ApiService.fetchAppointmentTypes();

      if (!mounted) {
        return;
      }

      setState(() {
        appointmentTypes = allAppointmentTypes
            .where((appointment) => appointment.bookOnline == true)
            .toList();
        _isLoading = false;
      });
    } catch (e) {
      print('Error fetching appointments 3: $e');
      if (!mounted) {
        return; 
      }
      setState(() => _isLoading = false);
    }
  }

  void _onAppointmentSelected(String appointmentId) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_appointment_id', appointmentId);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SelectedPackageScreen(
          selectedAppointmentId: appointmentId,
        ),
      ),
    );
  }
}
