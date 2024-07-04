import 'package:castle_couture/presentation/b_home_page/b_book_session_screen/widget/no_appointment.dart';
import 'package:castle_couture/presentation/c_appointment_screen/new_appointment_screens/new_select_appointment_type.dart';
import 'package:castle_couture/widgets/app_exit_widget.dart';
import 'package:castle_couture/widgets/custom_appbar/logo_appbar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'a_dashboard_screen/dashboard_screen.dart';
import 'c_profile_screen/screen/profile_screen.dart';
import 'd_menu_screen/screen/menu_screen.dart';
import 'widgets/bottom_navbar.dart';

class HomePage extends StatefulWidget {
  final int initialPage;
  const HomePage({super.key, this.initialPage = 0});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //late int _currentIndex;
  // PageController pageController = PageController();
  //@override
  //Widget build(BuildContext context) {
  //  return FutureBuilder<List<int>>(
  //      future: _loadAppointmentIds(),
  //      builder: (context, snapshot) {
  //        if (snapshot.connectionState == ConnectionState.waiting) {
  //          return const Scaffold(
  //            body: Center(child: CircularProgressIndicator()),
  //          );
  //        } else if (snapshot.hasError) {
  //          return Scaffold(
  //            body: Center(child: Text('Error: ${snapshot.error}')),
  //          );
  //        } else {
  //          final appointmentIds = snapshot.data ?? [];
  //          final bool hasAppointments = appointmentIds.isNotEmpty;

  //          final List<Widget> pages = hasAppointments
  //              ? [
  //                  const NewAppointmentScreen(),
  //                  const DashboardScreen(),
  //                  const ProfileScreen(),
  //                  const MenuScreen(),
  //                ]
  //              : [
  //                  const NewAppointmentScreen(),
  //                  const NoAppointment(),
  //                  const ProfileScreen(),
  //                  const MenuScreen(),
  //                ];

  //          return
  //              //BlocBuilder<BottomCubit, int>(
  //              //  builder: (context, currentIndex) {
  //              //    return
  //              PopScope(
  //canPop: false,
  //onPopInvoked: (didPop) async {
  //  if (_currentIndex == 0) {
  //    CustomShowDialog.buildExitDialog(context);
  //  } else {
  //    changePage(0);
  //  }
  //},
  //            child: Scaffold(
  //              extendBody: true,
  //              appBar: const LogoAppBar(),
  //              bottomNavigationBar: BottomNavbar(
  //                  selectedIndex: _currentIndex,
  //                  onTabChange: (index) {
  //                    changePage(index);
  //                  }),
  //              body: PageView(
  //                controller: pageController,
  //                onPageChanged: (index) {
  //                  changePage(index);
  //                },
  //                children: pages,
  //              ),
  //            ),
  //            //PageView(
  //            //  controller: context.read<BottomCubit>().pageController,
  //            //  onPageChanged: (index) =>
  //            //      context.read<BottomCubit>().changePage(index),
  //            //  children: pages,
  //            //),
  //          );
  //        }
  //      });
  //}
  //void changePage(int index) {
  //  setState(() {
  //    pageController.animateToPage(index,
  //        duration: const Duration(microseconds: 300), curve: Curves.ease);
  //    _currentIndex = index;
  //  });
  //}

  //@override
  //void dispose() {
  //  pageController.dispose();
  //  super.dispose();
  //}

  //@override
  //void initState() {
  //  super.initState();
  //  _currentIndex = widget.initialPage;
  //  pageController = PageController(initialPage: _currentIndex);
  //}

//  Future<List<int>> _loadAppointmentIds() async {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    List<String>? appointmentIds = prefs.getStringList('appointment_ids') ?? [];
//    return appointmentIds.map((id) => int.parse(id)).toList();
//  }
//}

  late int _currentIndex;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<int>>(
        future: _loadAppointmentIds(),
        builder: (context, snapshot) {
          final appointmentIds = snapshot.data ?? [];
          final bool hasAppointments = appointmentIds.isNotEmpty;

          final List<Widget> pages = [
            const NewAppointmentScreen(),
            hasAppointments ? const DashboardScreen() : const NoAppointment(),
            const ProfileScreen(),
            const MenuScreen(),
          ];
          return PopScope(
            canPop: false,
            onPopInvoked: (didPop) async {
              if (_currentIndex == 0) {
                CustomShowDialog.buildExitDialog(context);
              } else {
                changePage(0);
              }
            },
            child: Scaffold(
              extendBody: true,
              appBar: const LogoAppBar(),
              resizeToAvoidBottomInset: true,
              bottomNavigationBar: BottomNavbar(
                  selectedIndex: _currentIndex,
                  onTabChange: (index) {
                    changePage(index);
                  }),
              body: PageView(
                controller: pageController,
                onPageChanged: (index) {
                  changePage(index);
                },
                children: pages,
              ),
            ),
          );
        });
  }

  void changePage(int index) {
    setState(() {
      pageController.animateToPage(index,
          duration: const Duration(microseconds: 300), curve: Curves.ease);
      _currentIndex = index;
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialPage;
    pageController = PageController(initialPage: _currentIndex);
  }

  Future<List<int>> _loadAppointmentIds() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? appointmentIds = prefs.getStringList('appointment_ids') ?? [];
    return appointmentIds.map((id) => int.parse(id)).toList();
  }
}
