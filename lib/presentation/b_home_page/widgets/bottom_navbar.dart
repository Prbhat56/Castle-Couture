import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../../../core/app_export.dart';

class BottomNavbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTabChange;

  const BottomNavbar(
      {super.key, required this.selectedIndex, required this.onTabChange});

  @override
  Widget build(BuildContext context) {

    return CurvedNavigationBar(
      index: selectedIndex,
      height: 60.0,
      items: const <Widget>[
        Icon(Icons.home, size: 30),
        Icon(Icons.access_time_filled_rounded, size: 30),
        Icon(Icons.person, size: 30),
        Icon(Icons.format_align_right_rounded, size: 30),
      ],

      //color: Color(0xFFFFCC85),
      color: CustomColors.primaryOrange,
      backgroundColor: Colors.transparent,
      animationCurve: Curves.fastEaseInToSlowEaseOut,
      animationDuration: const Duration(milliseconds: 300),
      onTap: onTabChange,
    );
  }
}


/*  return ClipRRect(
      borderRadius: BorderRadius.circular(6.0),
      child: BottomNavigationBar(
        //  backgroundColor: Colors.red ,
        type: BottomNavigationBarType.fixed,
        // backgroundColor: Color.fromARGB(255, 193, 209, 240),
        selectedItemColor: CustomColors.primaryBlack,
        unselectedItemColor: CustomColors.strokeColor,
        //type: BottomNavigationBarType.shifting,
        onTap: onTabChange,
        currentIndex: selectedIndex,
        showUnselectedLabels: true,
        elevation: 0,
        */ /*selectedFontSize: 0.0,
        unselectedFontSize: 0.0,*/ /*
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv_outlined),
            label: 'Hoardings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Chatting',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_outlined),
            label: 'Profile',
          ),
        ],
      ),
    );
    */