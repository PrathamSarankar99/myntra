import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myntra/screens/categories_page.dart';
import 'package:myntra/screens/homepage.dart';
import 'package:myntra/screens/profile_page.dart';

class MyntraNavigationBar extends StatefulWidget {
  const MyntraNavigationBar({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  _MyntraNavigationBarState createState() => _MyntraNavigationBarState();
}

class _MyntraNavigationBarState extends State<MyntraNavigationBar> {
  late List<Widget> pages;

  @override
  void initState() {
    pages = [
      HomePage(),
      CategoriesPage(),
      ProfilePage(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      showUnselectedLabels: true,
      currentIndex: widget.index,
      showSelectedLabels: true,
      selectedLabelStyle: GoogleFonts.poppins(
        fontSize: 12,
      ),
      unselectedLabelStyle: GoogleFonts.poppins(
        fontSize: 12,
      ),
      onTap: (value) {
        if (value != widget.index) {
          NavigatorState state = Navigator.of(context);
          if (value != 0) {
            print("Pushed");
            state.push(PageRouteBuilder(
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return child;
              },
              pageBuilder: (context, animation, secondaryAnimation) {
                return pages[value];
              },
            ));
          } else {
            print("Replaced");
            while (state.canPop()) {
              state.pop();
            }
            state.pushReplacement(PageRouteBuilder(
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return child;
              },
              pageBuilder: (context, animation, secondaryAnimation) {
                return pages[value];
              },
            ));
          }
        }
        return;
      },
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            'assets/vector/myntra.svg',
            height: 20,
            color: widget.index == 0 ? Colors.blue : Colors.grey,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.dashboard_rounded,
            size: 20,
            color: widget.index == 1 ? Colors.blue : Colors.grey,
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
