import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MyntraNavigationBar extends StatelessWidget {
  const MyntraNavigationBar(
      {Key? key, required this.selectedIndex, required this.onTap})
      : super(key: key);
  final int selectedIndex;
  final Function(int) onTap;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      showUnselectedLabels: true,
      currentIndex: selectedIndex,
      showSelectedLabels: true,
      selectedLabelStyle: GoogleFonts.poppins(
        fontSize: 12,
      ),
      unselectedLabelStyle: GoogleFonts.poppins(
        fontSize: 12,
      ),
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/vector/myntra.svg',
            height: 20,
            color: selectedIndex == 0 ? Colors.blue : Colors.grey,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.dashboard_rounded,
            size: 20,
            color: selectedIndex == 1 ? Colors.blue : Colors.grey,
          ),
          label: 'Categories',
        ),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 22,
            ),
            label: 'Profile',
            tooltip: 'Home'),
      ],
    );
  }
}
